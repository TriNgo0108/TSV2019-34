import 'package:app/models/college.dart';
import 'package:app/views/widgets/college_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CollegesList extends StatefulWidget {
  @override
  _CollegesListState createState() => _CollegesListState();
}

class _CollegesListState extends State<CollegesList> with SingleTickerProviderStateMixin{
  PageController _pageController;
  PageController _indicatorCtrl;
  double _currentPage = 999;
  double initPage = 999;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.5, initialPage: initPage.toInt(), keepPage: false);
    _indicatorCtrl = PageController(viewportFraction: 0.1, initialPage: initPage.toInt(), keepPage: false);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 32,
          height: 300,
          padding: EdgeInsets.fromLTRB(8,8,0,8),
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            controller: _indicatorCtrl,
            itemBuilder: (_, i) => AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = _currentPage - i;
                value = (1 - (value.abs() * 0.16)).clamp(0.0, 1.0);
                
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 3 + 12 - 12*value,
                        horizontal: 12 - 12*value ,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: Colors.blueAccent)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${i%colleges.length+1}", 
                          style: TextStyle(
                            color: Colors.blueAccent, 
                            fontWeight: FontWeight.bold,
                            fontSize: 14*(10*value - 9)
                          )
                        )
                      ),
                    ),
                    Opacity(
                      opacity: 1 - value,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 3 + 12 - 12*value,
                          horizontal: 12 - 12*value ,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: Colors.blueAccent
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ),
        ),
        Expanded(
          child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    itemBuilder: (_, i) => CollegeWidget(
                        college: colleges[i%colleges.length],
                        pageController: _pageController,
                        index: i,
                        currentPage: _currentPage
                    ),
                    onPageChanged: (index) {
                      _indicatorCtrl.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);
                    },
                  ),
                ),
              ],
          ),
        ),
      ],
    );
  }
}
