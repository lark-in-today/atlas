import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';

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
        Navigator.pushNamed(context, '/topic');
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

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<GroupTopics>(
        future: groupTopics(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return topicList(context, snapshot.data.topics);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}
