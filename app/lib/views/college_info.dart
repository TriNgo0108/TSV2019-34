import 'package:app/models/college.dart';
import 'package:app/views/widgets/college_widget.dart';
import 'package:app/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CollegeInfo extends StatefulWidget {
  @override
  _CollegeInfoState createState() => _CollegeInfoState();
}

class _CollegeInfoState extends State<CollegeInfo> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Thông tin khoa',
        child: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Trường Đại học Cần Thơ có 17 Khoa và Viện ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              // tạo ra các college_widget widget
              children: <Widget>[
                for (var i = 0; i < colleges.length; i++)
                  CollegeWidget(
                      college: colleges[i],
                      pageController: _pageController,
                      currentPage: i)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
