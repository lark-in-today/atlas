import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/// topic detail
class TopicDetail {
  final String id;
  final String title;
  final String content;
  final dynamic comments;

  TopicDetail({this.id, this.title, this.content, this.comments});

  factory TopicDetail.fromJson(Map<String, dynamic> json) {
    return TopicDetail(
      id: json['id'],
      title: json['title'],
      content: json['content'],
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

/// create topic
class TopicCreateAPI {
  final String msg;

  TopicCreateAPI({ this.msg });

  factory TopicCreateAPI.fromJson(Map<String, dynamic> json) {
    return TopicCreateAPI(msg: json['msg']);
  }
}

Future<TopicCreateAPI> topicCreate({
  String title, String content, String group, String author
}) async {
  var res = await http.post(
    "${conf['url']}/group/$group/topic",
    body: {
      'title': title,
      'author': author,
      'content': content
    }
  );

  if (res.statusCode == 200) {
    return TopicCreateAPI.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
