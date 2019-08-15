import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';
import 'package:atlas/navigations/args.dart';

class Contacts extends StatelessWidget {
  final dynamic state;

  Contacts({
     Key key, @required this.state
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          line(
            context,
            '切换团队', '/contacts/change_group',
            GroupInfoArgs(name: state.name)
          ),
          line(
            context, '团队信息', '/contacts/group_info',
            GroupInfoArgs(name: state.name)
          ),
          Expanded(child: contactList(state.members))
        ]
      )
    );
  }
}

Widget line(BuildContext context, String title, String path, dynamic args) {
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
        Navigator.pushNamed(context, path, arguments: args);
      }
    )
  );
}

Widget contactList(List<dynamic> entries) {
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
          enabled: true,
          onTap: () => Navigator.pushNamed(context, '/contacts/member')
        ),
      );
    },
  );
}
