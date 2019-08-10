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

class Member extends StatefulWidget {
  Member({Key key}) : super(key: key);

  @override
  _Member createState() => _Member();
}

class _Member extends State<Member> {
  final List<String> settingList = <String>[
    '头像', '昵称', '手机号', '邮箱'
  ];
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: settings(settingList))
          ]
        )
      )
    );
  }
}
