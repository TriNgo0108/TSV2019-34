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
  var _animationCtrl;
  var animation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.5, initialPage: 999, keepPage: false);
    _indicatorCtrl = PageController(viewportFraction: 0.1, initialPage: 999, keepPage: false);
    _animationCtrl = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationCtrl)
        ..addListener((){setState(() {});});
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
                double value = 1;
                if (_indicatorCtrl.position.haveDimensions) {
                  value = _indicatorCtrl.page - i;
                  value = (1 - (value.abs() * 0.16)).clamp(0.0, 1.0);
                }
                
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
                        currentPage: i
                    ),
                    onPageChanged: (index) {
                      _animationCtrl.reverse();
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
