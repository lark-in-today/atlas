import 'package:flutter/material.dart';
import 'package:atlas/components/x.dart';

class Member extends StatelessWidget {
  final List<String> settingList = <String>['昵称', '邮箱'];
  
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
