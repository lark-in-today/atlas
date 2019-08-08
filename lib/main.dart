import 'package:flutter/material.dart';
import './navigations/tabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xffeeeeee),
      ),
      home: TabNavigator(),
    );
  }
}
