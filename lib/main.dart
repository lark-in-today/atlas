// flutter
import 'package:flutter/material.dart';
// bloc
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/main.dart';
import 'package:atlas/blocs/user.dart';
import 'package:atlas/blocs/group.dart';
import 'package:atlas/blocs/register.dart';
// pages
import 'package:atlas/pages/member.dart';
import 'package:atlas/pages/new_topic.dart';
import 'package:atlas/pages/join_group.dart';
import 'package:atlas/pages/comment.dart';
import 'package:atlas/pages/modify.dart';
import 'package:atlas/pages/group_info.dart';
import 'package:atlas/pages/change_group.dart';
import 'package:atlas/pages/sms.dart';
// navigations
import 'package:atlas/navigations/args.dart';
import 'package:atlas/navigations/topic.dart';
import 'package:atlas/navigations/tabbar.dart';

/* app */
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  UserBloc userBloc = UserBloc();
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          builder: (context) => ThemeBloc(),
        ),
        BlocProvider<UserBloc>(
          builder: (context) => userBloc,
        ),
        BlocProvider<GroupBloc>(
          builder: (context) => GroupBloc(userBloc),
        ),
        BlocProvider<RegisterBloc>(
          builder: (context) => RegisterBloc()
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) => app(context, theme)
      )
    );
  }
}

Widget app(BuildContext context, ThemeData theme) {
  return MaterialApp(
    theme: theme,
    initialRoute: '/',
    onGenerateRoute: router,
    home: TabNavigator(index: 0)
  );
}

/* app router */
MaterialPageRoute router(settings) {
  String r = settings.name;
  if (r == '/init') {
    final RootArgs args = settings.arguments;
    return MaterialPageRoute(
      builder: (context) =>  TabNavigator(index: args.index)
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
      builder: (context) => ChangeGroupPage()
    );
  } else if (r == '/contacts/group_info') {
    return MaterialPageRoute(
      builder: (context) =>  GroupInfoPage()
    );  
  } else if (r == '/contacts/member') {
    return MaterialPageRoute(
      builder: (context) =>  Member()
    );
  } else if (r == '/mine/modify') {
    final ModifyArgs args = settings.arguments;
    return MaterialPageRoute(
      builder: (context) => Modify(
        title: args.title,
        index: args.index
      )
    );
  } else if (r == '/mine/modify/sms') {
    return MaterialPageRoute(
      builder: (context) => Sms()
    );
  }

  return MaterialPageRoute(
    builder: (context) =>  TabNavigator()
  );  
}
