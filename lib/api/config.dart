import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> conf = {
  'url': 'http://localhost:6000/api_v0'
};

Future<String> token() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token') ?? '';
  return tk;
}

Future<String> getId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString('tel') ?? '';
  return id;
}

void setToken(String _tk) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', _tk);
}

Future<String> currentGroup() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String group = prefs.getString('current_group') ?? 'atlas';
  return group;
}
