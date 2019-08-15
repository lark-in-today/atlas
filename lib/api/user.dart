import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atlas/blocs/user.dart';
import './config.dart';

/** Get user info 
 * @pages: ['/mine']
 */
class UserInfo {
  final String tel;
  final String name;
  final String mail;

  UserInfo({this.tel, this.name, this.mail});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      tel: json['tel'],
      name: json['name'],
      mail: json['mail'],
    );
  }
}

Future<UserInfo> userInfo(String id) async {
  String tk = await token();
  var res = await http.get(
    conf['url'] + '/user/$id',
    headers: {
      'token': tk
    }
  );
    
  if (res.statusCode == 200) {
    return UserInfo.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/* get user groups */
class UserGroup {
  final dynamic current;
  final dynamic groups;

  UserGroup({ this.current, this.groups });

  factory UserGroup.fromJson(Map<String, dynamic> json) {
    return UserGroup(
      current: json['current'],
      groups: json['groups']
    );
  }
}

Future<UserGroup> userGroup() async {
  var res = await http.get(conf['url'] + '/user/0/groups');

  if (res.statusCode == 200) {
    return UserGroup.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
