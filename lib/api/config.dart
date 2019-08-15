import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> conf = {
  'url': 'http://localhost:6000/api_v0'
};

Future<String> token() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token') ?? '';
  return tk;
}

Future<String> currentGroup() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String group = prefs.getString('current_group') ?? '_';
  return group;
}
