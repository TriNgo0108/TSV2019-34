import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BotDialogFlow extends StatefulWidget {
  BotDialogFlow({Key key}) : super(key: key);

  @override
  _BotDialogFlow createState() => new _BotDialogFlow();
}

class _BotDialogFlow extends State<BotDialogFlow> {
  final connectivity = new Connectivity();
  bool _haveConnect = false;

  @override
  void initState() {
    super.initState();
    connectivity.checkConnectivity().then((ConnectivityResult value){
      if (value != ConnectivityResult.none) _haveConnect=true;
    });
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        _haveConnect=true;
      } else {
        _haveConnect=false;
      }
    });
  }

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Nhập lời nhắn tại đây..."),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _response(query) async {
    ChatMessage message;
    if (_haveConnect) {
      _textController.clear();
      AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/jsons/credentials.json").build();
      Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
      AIResponse response = await dialogflow.detectIntent(query);
      message = new ChatMessage(
        text: response.getMessage() ?? new CardDialogflow(response.getListMessage()[0],).title,
        name: "Chatbot",
        type: false,
      );
    } else {
      message = ChatMessage(text: 'Chatbot cần kết nối mạng để hoạt động, vui lòng kiểm tra Wifi hoặc mạng di động.',
        name: "Chatbot",
        type: false,
      );
    }
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    String msg = text.trim();
    if (msg == "") return;
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: msg,
      name: "Người dùng",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _response(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tư vấn tự động"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            color: Colors.white,
            onPressed: () => {
              launch("tel:02923872728")
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.facebookMessenger),
            color: Colors.white,
            onPressed: () => {
              launch("http://m.me/ctu.tvts")
            },
          )
        ],
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  Widget botMessage(context) {
    return Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(child: Image.asset('assets/images/placeholder.png')),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(text, style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6
                        ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 32,)
        ],
      );
  }

  Widget userMessage(context) {
    return Row(
        children: <Widget>[
          SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(text, textAlign: TextAlign.right),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ],
            ),
          )
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: this.type ? userMessage(context) : botMessage(context),
    );
  }
}