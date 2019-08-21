import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

class UserThum {
  final String name;
  final String mail;
  UserThum({ this.name, this.mail });

  factory UserThum.fromJson(Map<String, dynamic> json) {
    return UserThum(name: json['name'], mail: json['mail']);
  }
}

Future<UserThum> userThum(String name) async {
  String tk = await token();
  
  var res = await http.get(
    "${conf['url']}/user/$name/thum",
    headers: { 'token': tk }
  );
  
  if (res.statusCode == 200) {
    return UserThum.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/// Get user info 
/// @pages: ['/mine']
class UserInfo {
  final String tel;
  final String name;
  final String mail;
  final List<dynamic> groups;

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

/// TODO: other users
Future<UserInfo> userInfo(String id) async {
  String tk = await token();
  String id = await getId();
  
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
    body: { 'code': code}
  );
    
  if (res.statusCode == 200) {
    return UserSmsVerify.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/// Get register
/// @pages: ['/mine/modify']
Future<UserInfo> userUpdate(String key, dynamic value) async {
  String tk = await token();
  String tel = await getId();
  
  var res = await http.put(
    "${conf['url']}/user/$tel/update",
    headers: { 'token': tk },
    body: {
      'key': key, 'value': value
    }
  );
    
  if (res.statusCode == 200) {
    return UserInfo.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
