import 'package:app/models/college.dart';
import 'package:app/views/widgets/college_widget.dart';
import 'package:flutter/material.dart';

class CollegesList extends StatefulWidget {
  @override
  _CollegesListState createState() => _CollegesListState();
}

class _CollegesListState extends State<CollegesList> {
  PageController _pageController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: .5, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: colleges.length,
              itemBuilder: (context, i) => CollegeWidget(
                      college: colleges[i],
                      pageController: _pageController,
                      currentPage: i)
            ),
          ),
        ],
    );
  }
}
