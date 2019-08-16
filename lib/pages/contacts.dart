import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';
import 'package:atlas/navigations/args.dart';
// bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/group.dart';

class Contacts extends StatelessWidget {
  Contacts({ Key key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      child: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state is GroupChanged) {
            return column(context, state);
          } else {
            return Text('requesting');
          }
        }
      )
    );
  }
}

Widget column(BuildContext context, dynamic state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      line(context, '切换团队', '/contacts/change_group'),
      line(context, '团队信息', '/contacts/group_info'),
      Expanded(child: contactList(state.members))
    ]
  );
}

Widget line(BuildContext context, String title, String path) {
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
