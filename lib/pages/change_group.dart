import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/user.dart';

class ChangeGroupPage extends StatelessWidget {
  ChangeGroupPage({Key key}) : super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切换团队'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInited) {
            return container(context, state.groups);
          } else {
            return Text('requesting...');
          }
        }
      )
    );
  }
}

Widget container(BuildContext context, List<dynamic> groups) {
  return Container(
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
  );
}

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
