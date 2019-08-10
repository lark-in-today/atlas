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

class GroupInfo extends StatefulWidget {
  GroupInfo({Key key}) : super(key: key);

  @override
  _GroupInfo createState() => _GroupInfo();
}

class _GroupInfo extends State<GroupInfo> {
  final List<String> contacts = <String>[
    'The Beatles',
    'Pink Floyd', 'King Crimson', 'Resistance'
  ];
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('团队信息'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
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
