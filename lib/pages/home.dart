import 'package:flutter/material.dart';
import 'package:atlas/components/x.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final List<String> entries = <String>[
    'AMD lands Google, Twitter as customers with newest server chip ',
    'GitHub Actions now supports CI/CD, free for public repositories',
    'Svalbard is as close as you can get to a place with open borders '
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: card('${entries[index]}'),
            margin: EdgeInsets.symmetric(vertical: 6.0),
          );
        },
      ),
    );
  }
}
