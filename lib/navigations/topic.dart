import 'package:flutter/material.dart';
import 'package:atlas/api/topic.dart';
import 'package:atlas/pages/topic.dart';
import 'package:atlas/navigations/args.dart';

Widget topic(TopicArgs args) {
  return FutureBuilder<TopicDetail>(
    future: topicDetail(args.id),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Topic(
          id: args.id,
          title: snapshot.data.title,
          content: snapshot.data.content,
          comments: snapshot.data.comments,
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    }
  );
}
