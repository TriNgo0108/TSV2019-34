import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/question.dart';

class Poll extends StatefulWidget {
  @override
  _PollState createState() => _PollState();
}

class _PollState extends State<Poll> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _isFirstPage = true;
  bool _isLastPage = false;

  List<dynamic> _questions = [
    {
      "question": "Bạn dự định thi khối nào?",
      "answers": [
        "A00 (Toán, Lý, Hóa)",
        "A01 (Toán, Lý, Tiếng Anh)",
        "A02 (Toán, Lý, Sinh)",
        "B00 (Toán, Hóa, Sinh)",
        "C00 (Văn, Sử, Địa)",
        "C01 (Toán, Văn, Lý)",
        "C02 (Toán, Văn, Hóa)",
        "C19 (Văn, Sử, Giáo dục công dân)",
        "D01 (Toán, Văn, Tiếng Anh)",
        "D03 (Toán, Văn, Tiếng Pháp)",
        "D07 (Toán, Hóa, Tiếng Anh)",
        "D08 (Toán, Sinh, Tiếng Anh)",
        "D14 (Văn, Sử, Tiếng Anh)",
        "D15 (Văn, Địa, Tiếng Anh)",
        "D24 (Toán, Hóa, Tiếng Pháp)",
        "D29 (Toán, Lý, Tiếng Pháp)",
        "D66 (Văn, Giáo dục công dân, Tiếng Anh)",
        "T00 (Toán, Sinh, Năng khiếu TDTT)",
        "T01 (Toán, Hóa, Năng khiếu TDTT)"
      ]
    },
    {
      "question": "Chọn 2 môn mà bạn giỏi nhất?",
      "answers": ["Toán", "Lý", "Hóa", "Sinh", "Văn",  "Sử", "Địa", "Tiếng Anh", "Tiếng Pháp", "Năng khiếu TDTT", "Giáo dục công dân"]
    },
    {
      "question": "Bạn thích nhóm ngành nào?",
      "answers": [
        "Nông - lâm - ngư nghiệp",
        "Sư phạm",
        "Công nghệ thông tin",
        "Khoa học tự nhiên",
        "Kinh doanh",
        "Luật - nhân văn",
        "Sản xuất và chế biến",
        "Nghệ thuật - thẩm mỹ",
        "Báo chí - khoa học xã hội",
        "Kiến trúc và xây dựng"
      ]
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _questions.length);
    _isFirstPage = true;
    _isLastPage = false;
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
        _isFirstPage = false;
        _isLastPage = true;
      });
    else if (_tabController.index == 0)
      setState(() {
        _isFirstPage = true;
        _isLastPage = false;
      });
    else
      setState(() {
        _isFirstPage = false;
        _isLastPage = false;
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
                    onComplete: (selected) {
                      print(selected);
                      if (_isLastPage) 
                        Navigator.pop(context);
                      else
                        _nextPage(1);
                    },
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
              onPressed: () => _isLastPage ? Navigator.pop(context) : _nextPage(1),
            ),
          ),
        )
      ]),
    );
  }
}
