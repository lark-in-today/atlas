import 'package:flutter/material.dart';

Widget line(String title) {
  return Card(
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      dense: true
    )
  );
}

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
        ),
      );
    },
  );
}

class Group extends StatefulWidget {
  Group({Key key}) : super(key: key);

  @override
  _Group createState() => _Group();
}

class _Group extends State<Group> {
  final List<String> contacts = <String>[
    'David Bowie', 'Iggy Pop', 'Lou Reed'
  ];
  
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          line('切换团队'),
          Expanded(child: contactList(contacts))
        ]
      )
    );
  }
}
