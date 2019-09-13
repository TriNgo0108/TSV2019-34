import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fab extends StatefulWidget {


  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab>
    with SingleTickerProviderStateMixin {
  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      Navigator.pushNamed(context, '/${url}');
    } else {
      Toast.show('Không thể truy cập $url', context,
          duration: Toast.LENGTH_LONG);
    }
  }

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }
// tạo child floating action button sử dụng web view
  Widget webView(
    String name,
    String url,
    IconData icon,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FadeTransition(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 250,
              height: 30,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade300,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1), blurRadius: 4, color: Colors.grey)
                  ]),
            ),
            opacity: _animateIcon,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: name,
            onPressed: () {
              print('onButton');
              _launchURL(url, context);
            },
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
// tạo child floating action button sử dụng ứng dụng hệ thống
  Widget application(
    String name,
    String url,
    IconData icon,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FadeTransition(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 175,
              height: 30,
              child: Text(
                name,
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade300,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1), blurRadius: 4, color: Colors.grey)
                  ]),
            ),
            opacity: _animateIcon,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: name,
            onPressed: () {
              print('onButton');
              launch(url);
            },
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
// tạo floating action button gốc
  Widget toggle() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "toggle",
            backgroundColor: _buttonColor.value,
            onPressed: animate,
            tooltip: 'Toggle',
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animateIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget appearButton(Widget child(String titleName, String url, IconData icon), String titleName,
      String url, icon, index) {
    return Transform(
      transform: Matrix4.translationValues(
        0.0,
        _translateButton.value * index,
        0.0,
      ),
      child: child(titleName, url, icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          isOpened ?Positioned(
            right: -16.0,
            left: -16,
            top: -10,
            bottom: -16,
            child: FadeTransition(
              opacity: _animateIcon,
              child: Container(
                color: Colors.grey.withOpacity(0.8),
                height: height,
                width: width,
                child: Image.asset('assets/images/Agate.jpg'),
              ),
            ),
          ): SizedBox(),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                appearButton(application, 'Điện thoại',"tel:02923872728" ,
                    Icons.phone, 6),
                appearButton(webView, 'Thông tin tuyển sinh' ,'https://tuyensinh.ctu.edu.vn',
                    Icons.language, 5),
                appearButton(webView, 'Tân sinh viên' ,"http://tansinhvien.ctu.edu.vn",
                    Icons.language, 4),
                appearButton(application, 'Email' ,"mailto:tuyensinh@ctu.edu.vn",
                    Icons.email, 3),
                appearButton(application, 'Messenger',"http://m.me/ctu.tvts" ,
                    FontAwesomeIcons.facebookMessenger, 2),
                appearButton(webView, 'Facebook', 'https://fb.me/ctu.tvts',
                    FontAwesomeIcons.facebook, 1),
                toggle()
              ])
        ]);
  }
}
