import 'package:flutter/material.dart';
import 'package:atlas/navigations/args.dart';

// main
class Topic extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final List<dynamic> comments;

  Topic({
      Key key, this.id, this.title, this.comments, this.content
  }) : super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('话题'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
        child: Column(
          children: <Widget>[
            _title(title),
            _title(content),
            Divider(),
            _comments(comments),
            Divider(),
            _comment(context, id)
          ]
        )
      )
    );
  }
}

// topic title
Widget _title(String str) {
  return Card(
    child: ListTile(title: Text(str, style: TextStyle(fontSize: 14.0)))
  );
}

// topic content
Widget _content(String str) {
  return Card(
    child: ListTile(title: Text(str, style: TextStyle(fontSize: 14.0)))
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

// new comment
Widget _comment(BuildContext context, String id) {
  return GestureDetector(             
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, '/topic/topic/comment',
          arguments: CommentArgs(id: id)
        );
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
