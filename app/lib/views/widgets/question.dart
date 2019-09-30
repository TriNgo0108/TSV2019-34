import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Question extends StatefulWidget {
  final String question;
  final List<String> answers;
  final Function onComplete;

  Question(
      {@required this.question,
      @required this.answers,
      @required this.onComplete});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<String> selected = [];
  Color primaryColor;

  @override
  void initState() {
    super.initState();
    primaryColor = Color.fromRGBO(Random().nextInt(128), Random().nextInt(128),Random().nextInt(128), 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 62.0),
            Text(
              widget.question,
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(18.0),
                padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                child: ListView(
                  children: List<Widget>.generate(widget.answers.length, (index) => FlatButton(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          selected.contains(widget.answers[index])
                            ? Icon(Icons.check_box, color: primaryColor)
                            : Icon(Icons.check_box_outline_blank, color: primaryColor),
                          SizedBox(width: 18.0),
                          Text(widget.answers[index], style: TextStyle(color: primaryColor)),
                        ],
                      ),
                      onPressed: () => {
                        setState(() {
                          if (selected.contains(widget.answers[index])) {
                            selected.remove(widget.answers[index]);
                          } else {
                            selected.add(widget.answers[index]);
                          }
                        })
                      }
                    )
                  )
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
              child: Text('OK', style: TextStyle(color: primaryColor)),
              onPressed: () => {widget.onComplete(selected)},
            ),
            SizedBox(height: 62.0)
          ],
        ),
      ),
    );
  }
}
