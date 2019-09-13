import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Tuyển Sinh CTU',
      theme: appTheme,
      routes: {
        '/': (context) => MyHomePage(),
        '/welcome': (context) => Welcome(),
        '/https://fb.me/ctu.tvts': (context)=>WebViewContainer(url: "https://fb.me/ctu.tvts",title: 'Đại học Cần Thơ',),
        '/https://tuyensinh.ctu.edu.vn': (context)=>WebViewContainer(url: "https://tuyensinh.ctu.edu.vn",title: 'Thông tin tuyển sinh',),
        '/http://tansinhvien.ctu.edu.vn': (context)=>WebViewContainer(url: 'http://tansinhvien.ctu.edu.vn',title: 'Tân sinh viên',),
      },
      //initialRoute: '/welcome',
    );
  }
}
