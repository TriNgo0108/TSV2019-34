import 'package:app/views/widgets/drawer_menu.dart';
import 'package:app/views/widgets/fab.dart';
import 'package:app/views/widgets/major_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/specialization.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var specList = Provider.of<SpeList>(context);
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
          future: specList.loadData(),
          builder: (context, snapshot) {
            List<Specialization> sp = snapshot.data;
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: sp.length,
              itemBuilder: (context, index) => MajorCard(major: sp[index])
            );
          },
        )
      ),
    );
  }
}
