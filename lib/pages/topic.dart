import 'package:flutter/material.dart';
import 'package:atlas/api/topic.dart';

// arguments from navigator.
class TopicArgs {
  final String title;
  final String id;
  
  TopicArgs({this.title, this.id});
}

// topic title
Widget _title(String str) {
  return Card(
    child: ListTile(
      title: Text(
        '${str}',
        style: TextStyle(fontSize: 14.0),
      ),
    )
  );
}

// topic comments
Widget _comments(List<dynamic> entries) {
  return Expanded(
    child: ListView.separated(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Center(child: Text('${entries[index]}')),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
  );
}


// body
Widget _body(BuildContext context, TopicDetail detail) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 10.0
    ),
    child: Column(
      children: <Widget>[
        _title(detail.title),
        Divider(),
        _comments(detail.comments),
        Divider(),
        _comment(context)
      ]
    )
  );
}

// main
class Topic extends StatelessWidget {
  Widget build(BuildContext context) {
    final TopicArgs args = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('话题'),
      ),
      body: FutureBuilder<TopicDetail>(
        future: topicDetail(args.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _body(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        }
      )
    );
  }
}

// new comment
Widget _comment(BuildContext context) {
  return GestureDetector(             
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/comment');
      },
      child: Container(
        margin: EdgeInsets.only(top: 3.0),
        padding: EdgeInsets.symmetric(
          horizontal: 8.0
        ),
        child: Text(
          '发布新评论',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor
          )
        ),
      ),
    )
  );
}
