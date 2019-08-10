import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  Comment({Key key}) : super(key: key);

  @override
  _Comment createState() => _Comment();
}

class _Comment extends State<Comment> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布评论'),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                Navigator.pop(context);
              }
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '评论',
              ),
              minLines: 5,
              maxLines: 5,
            ),
          ]
        )
      ),
    );
  }
}
