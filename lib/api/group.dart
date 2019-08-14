import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/* get group info */
class GroupInfo {
  final String id;
  final String name;
  final dynamic members;

  GroupInfo({this.id, this.name, this.members});

  factory GroupInfo.fromJson(Map<String, dynamic> json) {
    return GroupInfo(
      id: json['id'],
      name: json['name'],
      members: json['members'],
    );
  }
}

Future<GroupInfo> groupInfo() async {
  var res = await http.get(conf['url'] + '/group/atlas');

  if (res.statusCode == 200) {
    return GroupInfo.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/* get group current */
class GroupCurrent {
  final String id;
  final String name;
  final List<dynamic> members;

  GroupCurrent({this.id, this.name, this.members});

  factory GroupCurrent.fromJson(Map<String, dynamic> json) {
    return GroupCurrent(
      id: json['id'],
      name: json['name'],
      members: json['members']
    );
  }
}

Future<GroupCurrent> groupCurrent() async {
  var res = await http.get(conf['url'] + '/group/current');

  if (res.statusCode == 200) {
    return GroupCurrent.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/* get group topics */
class GroupTopics {
  final dynamic topics;

  GroupTopics({ this.topics });

  factory GroupTopics.fromJson(Map<String, dynamic> json) {
    return GroupTopics(
      topics: json['topics'],
    );
  }
}

Future<GroupTopics> groupTopics() async {
  var res = await http.get(conf['url'] + '/group/atlas/topics');

  if (res.statusCode == 200) {
    return GroupTopics.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
