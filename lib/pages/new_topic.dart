import 'package:flutter/material.dart';
import 'package:atlas/navigations/args.dart';

class NewTopic extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建话题'),
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
                labelText: '话题',
              ),
              minLines: 3,
              maxLines: 3,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
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
