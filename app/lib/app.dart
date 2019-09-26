import 'package:app/providers/specialization.dart';
import 'package:app/views/college_info.dart';
import 'package:app/views/widgets/chatBot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './views/home.dart';
import './views/welcome.dart';
import 'theme.dart';
import 'views/web_view.dart';

class MyApp extends StatefulWidget { 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpeList>(
      builder: (_) => SpeList(),
      child: MaterialApp(
        title: 'Tuyển Sinh CTU',
        theme: appTheme,
        initialRoute: '/welcome',
        routes: {
          '/':              (context) => MyHomePage(),
          '/welcome':       (context) => Welcome(),
          '/web':           (context) => WebViewContainer(),
          '/chatbot':       (context) => BotDialogFlow(title: 'Tư vấn cùng Kelly',),
          '/college_info':  (context) => CollegeInfo()
        },
      ),
    );
  }
}
