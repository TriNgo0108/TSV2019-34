import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatelessWidget {

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
                    )
                ],)
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.facebook),
            title: Text("Facebook"),
            subtitle: Text("@ctu.tvts"),
            onTap: () => { launch("https://fb.me/ctu.tvts") },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Khu II, Đường 3 tháng 2"),
            subtitle: Text("Q. Ninh Kiều, TP. Cần Thơ."),
            onTap: () => { launch("https://goo.gl/maps/LcoVLjBFxPUtzAYh9") },
          ),
        ],
      ),
    );
  }
}