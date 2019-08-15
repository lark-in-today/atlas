import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/** Get group info 
 * @page: ['/contacts/group_info']
 */
class GroupInfo {
  final String id;
  final String name;

  GroupInfo({this.id, this.name});

  factory GroupInfo.fromJson(Map<String, dynamic> json) {
    return GroupInfo(
      id: json['id'],
      name: json['name'],
    );
  }
}

Future<GroupInfo> groupInfo(String id) async {
  String tk = await token();
  var res = await http.get(
    conf['url'] + '/group/$id',
    headers: {
      'token': tk
    }
  );

  if (res.statusCode == 200) {
    return GroupInfo.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/** Get group members
 * @page: ['/contacts']
 */
class GroupMembers {
  final String id;
  final dynamic members;

  GroupMembers({this.id, this.members});

  factory GroupMembers.fromJson(Map<String, dynamic> json) {
    return GroupMembers(
      id: json['id'],
      members: json['members'],
    );
  }
}

Future<GroupMembers> groupMembers(String id) async {
  String tk = await token();
  var res = await http.get(
    conf['url'] + '/group/${id}/members',
    headers: {
      'token': tk
    }
  );

  if (res.statusCode == 200) {
    return GroupMembers.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}


/** Get group topics
 * @page: '/home'
 */
class GroupTopics {
  final dynamic topics;

  GroupTopics({ this.topics });

  factory GroupTopics.fromJson(Map<String, dynamic> json) {
    return GroupTopics(
      topics: json['topics'],
    );
  }
}

Future<GroupTopics> groupTopics(String id) async {
  String tk = await token();
  var res = await http.get(
    conf['url'] + '/group/${id}/topics',
    headers: {
      'token': tk
    }
  );

  if (res.statusCode == 200) {
    return GroupTopics.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
