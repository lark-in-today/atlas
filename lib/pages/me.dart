import 'package:flutter/material.dart';

Widget line(String title) {
  return Container(
    padding: EdgeInsets.all(15.0),
    child: Text(title),
    decoration: BoxDecoration(
      color: Color(0xFFf9f9f9),
      border: Border.all(
        color: Color(0xffa2a2a2),
        width: 0.3,
      ),
      borderRadius: BorderRadius.circular(5.0)
    )
  );
}

Widget contactList(List<String> entries) {
  return ListView.builder(
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child:  Text("${entries[index]}"),
        margin: EdgeInsets.symmetric(vertical: 6.0),
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
  );
}

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  @override
  _Me createState() => _Me();
}

class _Me extends State<Me> {
  final List<String> contacts = <String>[
    '个人信息', '设置'
  ];
  
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: contactList(contacts))
        ]
      )
    );
  }
}
