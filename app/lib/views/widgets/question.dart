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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(Random().nextInt(128), Random().nextInt(128), Random().nextInt(128), 0.9),
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
              child: ListView.builder(
                itemCount: widget.answers.length,
                itemBuilder: (context, index) => FlatButton(
                      color: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Text(widget.answers[index]),
                      onPressed: () => print("selected"),
                    ),
              ),
            ),
            RaisedButton(
              child: Text('OK'),
              onPressed: widget.onComplete ?? () => {},
            )
          ],
        ),
      ),
    );
  }
}
