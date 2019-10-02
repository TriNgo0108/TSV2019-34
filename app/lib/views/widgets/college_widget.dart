
import 'package:app/models/college.dart';
import 'package:app/views/college_detail.dart';
import 'package:flutter/material.dart';

class CollegeWidget extends StatefulWidget {
  final College college;
  final PageController pageController;
  final double currentPage;
  final int index;

  const CollegeWidget({Key key, this.college, this.pageController, this.currentPage, this.index}) : super(key: key);

  @override
  _CollegeWidgetState createState() => _CollegeWidgetState();
}

class _CollegeWidgetState extends State<CollegeWidget> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CollegeDetail(college: widget.college)
              )
          );
        },
        child: AnimatedBuilder(
          animation: widget.pageController,
          builder: (context, child) {
            double value = widget.currentPage - widget.index;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);

            return Container(
              margin: EdgeInsets.fromLTRB(16*(1/value), 8, 16*(1/value), 8),
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                      tag: "background-${widget.college.imagePath}",
                      child: Image.asset(
                        widget.college.imagePath,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black45,
                        padding: EdgeInsets.all(12),
                        child: Text(widget.college.fullName,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18*value)),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
