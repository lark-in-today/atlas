// flutter
import 'package:flutter/material.dart';
// bloc
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/main.dart';
// pages
import 'package:atlas/navigations/tabbar.dart';
import 'package:atlas/pages/member.dart';
import 'package:atlas/pages/change_group.dart';
import 'package:atlas/pages/new_topic.dart';
import 'package:atlas/pages/join_group.dart';
import 'package:atlas/pages/group_info.dart';
import 'package:atlas/pages/topic.dart';
import 'package:atlas/pages/comment.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
      child: app(context)
    );
  }
}

Widget app(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Color(0xffeeeeee),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => TabNavigator(),
      '/topic': (context) => Topic(),
      '/comment': (context) => Comment(),
      '/change_group': (context) => ChangeGroup(),
      '/new_topic': (context) => NewTopic(),
      '/join_group': (context) => JoinGroup(),
      '/member': (context) => Member(),
      '/group_info': (context) => GroupInfo()
    },
  );
}
