import 'package:flutter/material.dart';
import 'package:atlas/pages/home.dart';
import 'package:atlas/pages/contacts.dart';
import 'package:atlas/pages/mine.dart';
// api
import 'package:atlas/api/user.dart';
import 'package:atlas/api/group.dart';
// bloc
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/group.dart';

/* actions */
List<Widget> actions(int index, BuildContext context) {
  if (index == 0) {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/topic/new_topic');
        },
      )
    ];
  } else if(index == 1) {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/contacts/join_group');
        },
      )
    ];
  } else {
    return [];
  }
}

/* titls */
List<String> titles = [
  '话题', '成员', '我的'
];

/* pages */
List<Widget> children = [
  tabHome(), tabContacts(), tabMe()
];

/* network wrappers */
Widget tabHome() {
  return BlocProvider(
    builder: (context) => GroupBloc()..dispatch(
      ChangeGroup(group: '')
    ),
    child: BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is CurrentGroup) {
          print(state.name);
          return Home(topics: state.topics);
        }
      }
    )
  );
}

Widget tabContacts() {
  return BlocProvider(
    builder: (context) => GroupBloc(),
    child: BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is CurrentGroup) {
          print(state.name);
          return Contacts(state: state);
        }
      }
    )
  );
}

Widget tabMe() {
  return FutureBuilder<UserInfo>(
    future: userInfo(''),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Me(info: snapshot.data);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return CircularProgressIndicator();
    }
  );
}
