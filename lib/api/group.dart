import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/** Get group members
 * @page: ['/contacts']
 */
class GroupData {
  final String id;
  final String name;
  final dynamic topics;
  final dynamic members;

  GroupData({
      this.id,
      this.name,
      this.topics,
      this.members
  });

  factory GroupData.fromJson(Map<String, dynamic> json) {
    return GroupData(
      id: json['id'],
      name: json['name'],
      topics: json['topics'],
      members: json['members'],
    );
  }
}

Future<GroupData> groupData(String id) async {
  String tk = await token();
  if (id == '' && tk == '') { id = '_'; }
  
  var res = await http.get(
    conf['url'] + '/group/${id}/data',
    headers: {
      'token': tk
    }
  );

  if (res.statusCode == 200) {
    return GroupData.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
