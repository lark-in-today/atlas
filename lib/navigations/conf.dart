import 'package:flutter/material.dart';
import 'package:atlas/pages/home.dart';
import 'package:atlas/pages/contacts.dart';
import 'package:atlas/pages/mine.dart';
import 'package:atlas/api/user.dart';
import 'package:atlas/api/group.dart';

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
Widget tabMe() {
  return FutureBuilder<UserInfo>(
    future: userInfo('_'),
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

Widget tabContacts() {
  return FutureBuilder<GroupInfo>(
    future: groupInfo(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<dynamic> members = snapshot.data.members;
        return Contacts(members: members);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return CircularProgressIndicator();
    }
  );
}

Widget tabHome() {
  return FutureBuilder<GroupTopics>(
    future: groupTopics(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Home(topics: snapshot.data.topics);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    }
  );
}
