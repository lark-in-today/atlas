import 'package:flutter/material.dart';
// bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/user.dart';
import 'package:atlas/blocs/group.dart';

// main
class GroupInfoPage extends StatelessWidget {
  GroupInfoPage({ Key key }): super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('团队信息'),
      ),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state is GroupChanged) {
            return container(context, state);
          } else {
            return Text('requesting...');
          }
        }
      )
    );
  }
}

Widget container(BuildContext context, dynamic info) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 10.0
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _title(info.name),
        Divider(),
        exit(context)
      ]
    )
  );
}

// group title
Widget _title(String title) {
  return Card(
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.0),
      ),
    ),
  );
}

// exit wrappr
// if not login, do not show exit
Widget exit(BuildContext context) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      if (state is UserInited) {
        if (state.tel == '') { return SizedBox.shrink(); }
        return _exit(context);
      }
      return SizedBox.shrink();
    }
  );
}

// exit group
Widget _exit(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 5.0
    ),
    child: RaisedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        '退出团队',
        style: TextStyle(fontSize: 20)
      ),
    ),
  );
}
