import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';

Widget groupList(List<dynamic> entries) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 10.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text(
            "${entries[index]['name']}",
            style: TextStyle(fontSize: 14.0),
          ),
          dense: true,
          trailing: null,
          enabled: true,
          onTap: () { Navigator.pop(context); }
        ),
      );
    },
  );
}

class ChangeGroup extends StatelessWidget {
  final List<dynamic> groups;
  ChangeGroup({
      Key key, @required this.groups
  }) : super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切换团队'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: groupList(groups)),
            // first child
          ]
        )
      ),
    );
  }
}
