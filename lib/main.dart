import 'package:flutter/material.dart';
import 'package:atlas/navigations/tabbar.dart';
import 'package:atlas/pages/groups.dart';

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
        '/groups': (context) => Groups()
      },
    );
  }
}
