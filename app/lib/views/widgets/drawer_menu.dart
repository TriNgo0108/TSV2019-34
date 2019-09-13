import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:toast/toast.dart';

class DrawerMenu extends StatelessWidget {

  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      Navigator.pushNamed(context, '/${url}');
    } else {
       Toast.show('Không thể truy cập $url', context, duration: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset("assets/images/dhct.png")
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.call),
                      color: Colors.white,
                      onPressed: () => {
                        launch("tel:02923872728")
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.mail),
                      color: Colors.white,
                      onPressed: () => {
                        launch("mailto:tuyensinh@ctu.edu.vn")
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.facebookMessenger),
                      color: Colors.white,
                      onPressed: () => {
                        launch("http://m.me/ctu.tvts")
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.viber),
                      color: Colors.white,
                      onPressed: () => {
                        launch("http://zalo.me/0886889922")
                      },
                    ),
                ],)
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Giới thiệu"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Thông tin tuyển sinh"),
            subtitle: Text("https://tuyensinh.ctu.edu.vn"),
            onTap: () => { _launchURL("https://tuyensinh.ctu.edu.vn", context) },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Tân sinh viên"),
            subtitle: Text("http://tansinhvien.ctu.edu.vn"),
            onTap: () => { _launchURL("https://tuyensinh.ctu.edu.vn", context) },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.facebook),
            title: Text("Facebook"),
            subtitle: Text("@ctu.tvts"),
            onTap: () => { _launchURL("https://fb.me/ctu.tvts", context) },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Khu II, Đường 3 tháng 2"),
            subtitle: Text("Q. Ninh Kiều, TP. Cần Thơ."),
            onTap: () => { _launchURL("https://goo.gl/maps/LcoVLjBFxPUtzAYh9", context) },
          ),
        ],
      ),
    );
  }
}