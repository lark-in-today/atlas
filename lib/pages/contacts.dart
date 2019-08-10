import 'package:flutter/material.dart';

Widget line(String title, BuildContext context, String path) {
  return Card(
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.0),
      ),
      trailing: Icon(Icons.chevron_right),
      dense: true,
      enabled: true,
      onTap: () {
        Navigator.pushNamed(context, path);
      }
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
          enabled: true,
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          }
        ),
      );
    },
  );
}

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  _Contacts createState() => _Contacts();
}

class _Contacts extends State<Contacts> {
  final List<String> contacts = <String>[
    'David Bowie', 'Iggy Pop', 'Lou Reed'
  ];
  
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          line('切换团队', context, '/change_group'),
          line('团队信息', context, '/group_info'),
          Expanded(child: contactList(contacts))
        ]
      )
    );
  }
}
