import 'package:flutter/material.dart';
import './views/home.dart';
import './views/welcome.dart';
import 'theme.dart';

class MyApp extends StatelessWidget { 

  List<String> groups;
  List<String> subjects;
  List<String> jobs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuyển Sinh CTU',
      theme: appTheme,
      routes: {
        '/': (context) => MyHomePage(),
        '/welcome': (context) => Welcome()
      },
      initialRoute: '/welcome',
    );
  }
}
