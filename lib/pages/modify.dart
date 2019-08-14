import 'package:flutter/material.dart';

class Modify extends StatelessWidget {
  final String title;
  
  Modify({
      Key key, @required this.title
  }) : super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: title,
              ),
            ),
          ]
        )
      ),
    );
  }
}
