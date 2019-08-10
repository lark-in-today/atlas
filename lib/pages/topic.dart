import 'package:flutter/material.dart';

class Topic extends StatefulWidget {
  Topic({Key key}) : super(key: key);

  @override
  _Topic createState() => _Topic();
}

class _Topic extends State<Topic> {
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
            Card(
              child: ListTile(
                title: const Text(
                  '这里是标题',
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                ),
              ),
            ),
            Divider(),
            Card(
              child: Container(
                height: 100,
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text('这里是一些评论'),
                )
              ),
            ),
            Divider(),
            GestureDetector(             
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
            )
          ]
        )
      ),
    );
  }
}
