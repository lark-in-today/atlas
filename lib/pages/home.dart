import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';
import 'package:atlas/pages/topic.dart';
import 'package:atlas/navigations/args.dart';

Widget card(String title, BuildContext context) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          title,
          style: TextStyle(fontSize: 14)
        ),
        padding: EdgeInsets.symmetric(vertical: 6.0),
      ),
      dense: true,
      onTap: () {
        Navigator.pushNamed(
          context, '/topic/topic',
          arguments: TopicArgs(title: title, id: '000')
        );
      }
    ),
  );
}

Widget topicList(BuildContext context, List<dynamic> topics) {
  return ListView.builder(
    padding: EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 10.0
    ),
    itemCount: topics.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child: card("${topics[index]['title']}", context),
        
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}

class Home extends StatelessWidget {
  final List<dynamic> topics;
  Home({
      Key key, @required this.topics
  }) : super(key: key);
  
  Widget build(BuildContext context) {
    return Container(
      child: topicList(context, topics)
    );
  }
}
