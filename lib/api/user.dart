import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/// Get user info 
/// @pages: ['/mine']
class UserInfo {
  final String tel;
  final String name;
  final String mail;
  final dynamic groups;

  UserInfo({this.tel, this.name, this.mail, this.groups});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      tel: json['tel'],
      name: json['name'],
      mail: json['mail'],
      groups: json['groups']
    );
  }
}

Future<UserInfo> userInfo(String id) async {
  String tk = await token();
  if (id == '' && tk == '') { id = '_'; }

  var res = await http.get(
    "${conf['url']}/user/$id",
    headers: { 'token': tk }
  );
    
  if (res.statusCode == 200) {
    return UserInfo.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/// Get register
/// @pages: ['/mine/modify']
class UserSMSAPI {
  final String msg;
  UserSMSAPI({this.msg});

  factory UserSMSAPI.fromJson(Map<String, dynamic> json) {
    return UserSMSAPI(msg: json['msg']);
  }
}

Future<UserSMSAPI> userSms(String tel) async {
  var res = await http.post("${conf['url']}/user/$tel/sms");
    
  if (res.statusCode == 200) {
    return UserSMSAPI.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/// Get register
/// @pages: ['/mine/modify']
class UserSmsVerify {
  final String msg;
  final String token;
  UserSmsVerify({this.msg, this.token});

  factory UserSmsVerify.fromJson(Map<String, dynamic> json) {
    return UserSmsVerify(
      msg: json['msg'],
      token: json['token']
    );
  }
}

Future<UserSmsVerify> userSmsVerify(String tel, String code) async {
  var res = await http.post(
    "${conf['url']}/user/$tel/sms_verify",
    body: {
      'code': code
    }
  );
    
  if (res.statusCode == 200) {
    return UserSmsVerify.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

