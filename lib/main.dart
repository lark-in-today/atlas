// flutter
import 'package:flutter/material.dart';
// bloc
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/main.dart';
// pages
import 'package:atlas/pages/member.dart';
import 'package:atlas/pages/new_topic.dart';
import 'package:atlas/pages/join_group.dart';
import 'package:atlas/pages/comment.dart';
import 'package:atlas/pages/modify.dart';
// navigations
import 'package:atlas/navigations/args.dart';
import 'package:atlas/navigations/topic.dart';
import 'package:atlas/navigations/change_group.dart';
import 'package:atlas/navigations/group_info.dart';
import 'package:atlas/navigations/tabbar.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return app(context, theme);
        }
      ) 
    );
  }
}

Widget app(BuildContext context, ThemeData theme) {
  return MaterialApp(
    theme: theme,
    initialRoute: '/',
    onGenerateRoute: router,
    home: TabNavigator()
  );
}

// app router
MaterialPageRoute router(settings) {
  String r = settings.name;
  
  if (r == '/mine/modify') {
    final ModifyArgs args = settings.arguments;
    return MaterialPageRoute(
      builder: (context) =>  Modify(title: args.title)
    );
  } else if (r == '/topic/new_topic') {
    return MaterialPageRoute(
      builder: (context) =>  NewTopic()
    );
  } else if (r == '/topic/topic') {
    final TopicArgs args = settings.arguments;
    return MaterialPageRoute(
      builder: (context) =>  topic(args)
    );
  } else if (r == '/topic/topic/comment') {
    final CommentArgs args = settings.arguments;
    return MaterialPageRoute(
      builder: (context) =>  Comment(id: args.id)
    );
  } else if (r == '/contacts/join_group') {
    return MaterialPageRoute(
      builder: (context) =>  JoinGroup()
    );
  } else if (r == '/contacts/change_group') {
    return MaterialPageRoute(
      builder: (context) =>  change_group()
    );
  } else if (r == '/contacts/group_info') {
    return MaterialPageRoute(
      builder: (context) =>  group_info()
    );  
  } else if (r == '/contacts/member') {
    return MaterialPageRoute(
      builder: (context) =>  Member()
    );  
  }
}
