import 'package:flutter/material.dart';

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
            child:  Text("${entries[index]}"),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xFFf9f9f9),
              border: Border.all(
                color: Color(0xffa2a2a2),
                width: 0.3,
              ),
              borderRadius: BorderRadius.circular(5.0)
            )
          );
        },
      ),
    );
  }
}
