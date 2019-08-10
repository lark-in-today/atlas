import 'package:flutter/material.dart';

Widget contactList(List<String> entries) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 10.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text(
            "${entries[index]}",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          dense: true,
          trailing: null,
          enabled: true,
        ),
      );
    },
  );
}

class JoinGroup extends StatefulWidget {
  JoinGroup({Key key}) : super(key: key);

  @override
  _JoinGroup createState() => _JoinGroup();
}

class _JoinGroup extends State<JoinGroup> {
  final List<String> contacts = <String>[
    'The Beatles',
    'Pink Floyd', 'King Crimson', 'Resistance'
  ];
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加入团队'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: contactList(contacts))
          ]
        )
      ),
    );
  }
}
