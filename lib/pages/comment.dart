import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String id;
  Comment({
      Key key, @required this.id
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布评论'),
        actions: _actions(context)
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0
        ),
        child: _column()
      ),
    );
  }
}

List<Widget> _actions(BuildContext context) {
  return <Widget>[
    Container(
      child: IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    )
  ];
}

Widget _column() {
  return Column(
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
  );
}
