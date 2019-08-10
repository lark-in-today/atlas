import 'package:flutter/material.dart';

class NewTopic extends StatefulWidget {
  NewTopic({Key key}) : super(key: key);

  @override
  _NewTopic createState() => _NewTopic();
}

class _NewTopic extends State<NewTopic> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建话题'),
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
            Divider(),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
              child: const Text(
                '发布话题',
                style: TextStyle(fontSize: 20)
              ),
            ),
          ]
        )
      ),
    );
  }
}
