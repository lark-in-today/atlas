import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/// topic detail
class TopicDetail {
  final String id;
  final String title;
  final dynamic comments;

  TopicDetail({this.id, this.title, this.comments});

  factory TopicDetail.fromJson(Map<String, dynamic> json) {
    return TopicDetail(
      id: json['id'],
      title: json['title'],
      comments: json['comments'],
    );
  }
}

Future<TopicDetail> topicDetail(String id) async {
  var res = await http.get("${conf['url']}/topic/$id");

  if (res.statusCode == 200) {
    return TopicDetail.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
