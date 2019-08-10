import 'package:flutter/material.dart';

Widget contactList(List<String> entries) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 10.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text(
            "${entries[index]}",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          dense: true,
          trailing: null,
          enabled: true,
        ),
      );
    },
  );
}

class NewTopic extends StatefulWidget {
  NewTopic({Key key}) : super(key: key);

  @override
  _NewTopic createState() => _NewTopic();
}

class _NewTopic extends State<NewTopic> {
  final List<String> contacts = <String>[
    'The Beatles',
    'Pink Floyd', 'King Crimson', 'Resistance'
  ];
  
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
              onPressed: () {},
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
