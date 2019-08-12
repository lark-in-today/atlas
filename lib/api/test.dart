import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<String> test() async {
  var url = "http://localhost:6000/";
  var response = await http.get(url);
  String body = response.body;

  return body;
}
