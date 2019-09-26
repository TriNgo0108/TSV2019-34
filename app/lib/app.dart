import 'package:app/providers/specialization.dart';
import 'package:app/views/college_info.dart';
import 'package:app/views/widgets/chatBot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './views/home.dart';
import './views/welcome.dart';
import 'theme.dart';
import 'views/widgets/web_view_Container.dart';

class MyApp extends StatefulWidget { 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> groups;
  List<String> subjects;
  List<String> jobs;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpeList>(
      builder: (_) => SpeList(),
      child: MaterialApp(
        title: 'Tuyển Sinh CTU',
        theme: appTheme,
        routes: {
          '/': (context) => MyHomePage(),
          '/welcome': (context) => Welcome(),
          '/introduce': (context)=> WebViewContainer(url: "https://www.ctu.edu.vn/gioi-thieu.html",title: 'Đại học Cần Thơ',),
          '/https://fb.me/ctu.tvts': (context)=>WebViewContainer(url: "https://fb.me/ctu.tvts",title: ' Facebook Đại học Cần Thơ',),
          '/https://tuyensinh.ctu.edu.vn': (context)=>WebViewContainer(url: "https://tuyensinh.ctu.edu.vn",title: 'Thông tin tuyển sinh',),
          '/http://tansinhvien.ctu.edu.vn': (context)=>WebViewContainer(url: 'http://tansinhvien.ctu.edu.vn',title: 'Tân sinh viên',),
          '/chatbot':(context)=>BotDialogFlow(title: 'Tư vấn cùng Kelly',),
          '/college_info':(context)=> CollegeInfo()
        },
        initialRoute: '/welcome',
      ),
    );
  }
}
