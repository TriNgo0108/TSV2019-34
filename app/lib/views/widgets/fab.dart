import 'package:app/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as Math;

class Fab extends StatefulWidget {
  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> with SingleTickerProviderStateMixin {
  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      Navigator.pushNamed(context, '/web', arguments: WebViewArgs(url, url));
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
  Animation<double> _toggleButton;
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
    _toggleButton = Tween<double>(begin: 0, end: Math.pi /4).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0, 1, curve: _curve)));
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
              width: 260,
              height: 40,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
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
              width: 260,
              height: 40,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
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
              child: Transform.rotate(
                angle: _toggleButton.value,
                child: Icon(Icons.add),
              )),
        ],
      ),
    );
  }

// floating action button với hiệu ứng transform
  Widget appearButton(Widget child(String titleName, String url, IconData icon),
      String titleName, String url, icon, index) {
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
    return Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          isOpened
              ? Positioned(
                  right: -16.0,
                  left: -16,
                  top: -10,
                  bottom: -16,
                  child: FadeTransition(
                    opacity: _animateIcon,
                    child: Container(
                      color: Colors.white,
                      child: FittedBox(
                        child: Image.asset(
                          'assets/images/Agate.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          isOpened
              ? Positioned(
                  right: -16.0,
                  left: -16,
                  top: -10,
                  bottom: -16,
                  child: FadeTransition(
                    opacity: _animateIcon,
                    child: Opacity(
                      child: Container(
                        color: Colors.white,
                      ),
                      opacity: 0.9,
                    ),
                  ),
                )
              : SizedBox(),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                appearButton(webView, 'Tại sao chọn ĐH Cần Thơ',
                    'https://tuyensinh.ctu.edu.vn/gioi-thieu/839-ly-do-de-hoc-tai-truong-dhct.html', Icons.star, 3),
                appearButton(webView, 'Thông tin tuyển sinh',
                    'https://tuyensinh.ctu.edu.vn', Icons.person_add, 2),
                appearButton(webView, 'Tân sinh viên',
                    "http://tansinhvien.ctu.edu.vn", Icons.school, 1),
                toggle()
              ])
        ]);
  }
}
