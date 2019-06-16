import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/question.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _isDone = false;
  bool _isFirstPage = true;

  List<dynamic> _questions = [
    {
      "question": "Bạn dự định thi khối nào?",
      "answers": [
        "A (Toán, Lý, Hóa)",
        "A1 (Toán, Lý, AV)",
        "A1 (Toán, Lý, AV)",
        "A1 (Toán, Lý, AV)",
        "A1 (Toán, Lý, AV)",
        "A1 (Toán, Lý, AV)"
      ],
      "color": Colors.indigo
    },
    {
      "question": "Chọn 2 môn mà bạn giỏi nhất?",
      "answers": ["Toán", "Lý", "Hóa", "Văn", "Anh Văn"],
      "color": Colors.purple
    },
    {
      "question": "Bạn thích làm công việc gì?",
      "answers": [
        "Làm việc văn phòng",
        "Giao tiếp với mọi người",
        "Được đi nhiều nơi"
      ],
      "color": Colors.green
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _questions.length);
    _isDone = false;
    _isFirstPage = true;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
    if (_tabController.index == _tabController.length - 1)
      setState(() {
        _isDone = true;
        _isFirstPage = false;
      });
    else if (_tabController.index == 0)
      setState(() {
        _isDone = false;
        _isFirstPage = true;
      });
    else
      setState(() {
        _isDone = false;
        _isFirstPage = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: List.generate(
              _questions.length,
              (index) => Question(
                    question: _questions[index]["question"],
                    answers: _questions[index]["answers"],
                    onComplete: () => print('Complete'),
                  ),
            )),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: TabPageSelector(
                        indicatorSize: 8.0,
                        controller: _tabController,
                        color: Colors.transparent,
                        selectedColor: Colors.white,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: _isFirstPage
                ? Text('')
                : FlatButton(
                    child: Text(
                      'Quay lại',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    onPressed: () => _nextPage(-1),
                  ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: FlatButton(
              child: Text('Bỏ qua',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic)),
              onPressed: () => _nextPage(1),
            ),
          ),
        )
      ]),
    );
  }
}
