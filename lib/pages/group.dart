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
    padding: EdgeInsets.only(top: 20.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child:  Text("${entries[index]}"),
        margin: EdgeInsets.symmetric(vertical: 3.0),
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
