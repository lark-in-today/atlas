import 'package:flutter/material.dart';

class JoinGroup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加入团队'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '团队名称',
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
              child: const Text(
                '加入',
                style: TextStyle(fontSize: 20)
              ),
            ),
          ]
        )
      ),
    );
  }
}
