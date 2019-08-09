import 'package:flutter/material.dart';
import 'package:atlas/components/x.dart';

Widget settings(List<String> entries) {
  return ListView.builder(
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child:  card('${entries[index]}'),
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  @override
  _Me createState() => _Me();
}

class _Me extends State<Me> {
  final List<String> settingList = <String>[
    '个人信息', '设置'
  ];
  
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: settings(settingList))
        ]
      )
    );
  }
}
