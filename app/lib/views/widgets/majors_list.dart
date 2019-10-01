import 'package:app/providers/specialization.dart';
import 'package:app/views/widgets/major_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MajorList extends StatelessWidget {
  final String title;
  final List<Specialization> majors;
  final bool isLoading;
  final String heroTag;

  const MajorList({Key key, this.title, this.majors, this.isLoading = false, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(8,10,8,3),
          child: Text(title, style: Theme.of(context).textTheme.title)
        ),
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 260),
          child: isLoading ? LinearProgressIndicator() : ListView(
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(majors.length, (index) => Container(
              width: 300,
              child: Card(
                child: MajorCard(major: majors[index], heroTag: this.heroTag),
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(8),
              ),
            )),
          ),
        ),
      ],
    );
  }
}