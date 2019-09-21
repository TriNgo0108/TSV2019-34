import 'dart:async';

import 'package:app/models/majors.dart';
import 'package:app/views/widgets/drawer_menu.dart';
import 'package:app/views/widgets/fab.dart';
import 'package:app/views/widgets/major_card.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    // TODO: implement initState
    connectivity = new Connectivity();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Trang chủ"),actions: <Widget>[
        IconButton(icon: Icon(FontAwesomeIcons.robot) , onPressed: (){
          Navigator.pushNamed(context, '/chatbot');
        })
      ],),
      drawer: DrawerMenu(),
      floatingActionButton: Fab(),
      body: SafeArea(
        child: FutureBuilder(
          future: getMajorsList(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  List<Major> majors = snapshot.data;
                  return ListView.builder(
                    itemCount: majors.length,
                    itemBuilder: (context, index) => MajorCard(major: majors[index])
                  );
                }
                break;
              default:
                return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
