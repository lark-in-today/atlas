import 'package:flutter/material.dart';

class Modify extends StatefulWidget {
  final String title;
  Modify({Key key, this.title}) : super(key: key);
  
  @override
  _Modify createState() => _Modify();
}

class _Modify extends State<Modify> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.check)
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
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
                labelText: widget.title,
              ),
            ),
          ]
        )
      ),
    );
  }
}

class ModifyArguments {
  final String title;

  ModifyArguments(this.title);
}
