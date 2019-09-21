
import 'package:app/models/college.dart';
import 'package:app/views/college_detail_page.dart';
import 'package:flutter/material.dart';

class CollegeWidget extends StatefulWidget {
  final College college;
  final PageController pageController;
  final int currentPage;

  const CollegeWidget(
      {Key key, this.college, this.pageController, this.currentPage})
      : super(key: key);

  @override
  _CollegeWidgetState createState() => _CollegeWidgetState();
}

class _CollegeWidgetState extends State<CollegeWidget> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CollegeDetailPage(
                        college: widget.college,
                      )));
          // chuyển đến trang giới thiệu khoa
        },
        child: AnimatedBuilder(
          animation: widget.pageController,
          builder: (context, child) {
            double value = 1;
            if (widget.pageController.position.haveDimensions) {
              value = widget.pageController.page - widget.currentPage;
              value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
            }
            return Card(
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: "background-${widget.college.imagePath}",
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                          color: Colors.grey.shade100,
                          offset: Offset(20.0, 10.0)
                          )
                        ]
                      ),
                      // bo cong hình nền của widget
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image.asset(
                          widget.college.imagePath,
                          height: screenHeight * 0.55 * value,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Hero(
                        tag: "name-${widget.college.name}",
                        child: Material(
                          elevation: 4,
                          shadowColor: Colors.grey.shade300,
                          child: Container(
                            child: Text(
                              widget.college.name,
                              style: TextStyle(
                                fontSize: 28 * value,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
