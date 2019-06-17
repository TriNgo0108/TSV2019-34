import 'dart:math';

import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final String question;
  final List<String> answers;
  final Function onComplete;

  Question(
      {@required this.question,
      @required this.answers,
      @required this.onComplete});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<bool> selected = List();
  Color primaryColor;

  @override
  void initState() {
    super.initState();
    selected.length = widget.answers.length;
    selected.fillRange(0, widget.answers.length, false);
    primaryColor = Color.fromRGBO(Random().nextInt(128), Random().nextInt(128),Random().nextInt(128), 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 62.0,
            ),
            Text(
              widget.question,
              style: TextStyle(color: Colors.white),
            ),
            Container(
              height: 280.0,
              margin: EdgeInsets.all(18.0),
              padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
              child: ListView.builder(
                itemCount: widget.answers.length,
                itemBuilder: (context, index) => FlatButton(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          selected[index]
                              ? Icon(
                                  Icons.check_box,
                                  color: primaryColor,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank,
                                  color: primaryColor,
                                ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            widget.answers[index],
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                      onPressed: () => {
                            setState(() => {selected[index] = !selected[index]})
                          },
                    ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
              child: Text('OK', style: TextStyle(color: primaryColor)),
              onPressed: () => {widget.onComplete(selected)},
            )
          ],
        ),
      ),
    );
  }
}
