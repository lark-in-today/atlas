import 'package:flutter/material.dart';
import 'package:atlas/navigations/tabbar.dart';
import 'package:atlas/pages/change_group.dart';
import 'package:atlas/pages/new_topic.dart';
import 'package:atlas/pages/join_group.dart';
import 'package:atlas/pages/member.dart';
import 'package:atlas/pages/group_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xffeeeeee),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabNavigator(),
        '/change_group': (context) => ChangeGroup(),
        '/new_topic': (context) => NewTopic(),
        '/join_group': (context) => JoinGroup(),
        '/member': (context) => Member(),
        '/group_info': (context) => GroupInfo()
      },
    );
  }
}
