import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/// Get group members
/// @page: ['/contacts']
class GroupData {
  final String name;
  final dynamic topics;
  final dynamic members;

  GroupData({
      this.name,
      this.topics,
      this.members
  });

  factory GroupData.fromJson(Map<String, dynamic> json) {
    return GroupData(
      name: json['name'],
      topics: json['topics'],
      members: json['members'],
    );
  }
}

Future<GroupData> groupData(String group) async {
  String tk = await token();
  
  var res = await http.get(
    "${conf['url']}/group/$group/data",
    headers: { 'token': tk }
  );

  if (res.statusCode == 200) {
    return GroupData.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
