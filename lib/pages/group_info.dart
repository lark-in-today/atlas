import 'package:flutter/material.dart';

// main
class GroupInfoPage extends StatelessWidget {
  final String name;
  GroupInfoPage({
      Key key, this.name
  }): super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('团队信息'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _title(name),
            Divider(),
            _exit(context)
          ]
        )
      ),
    );
  }
}


// group title
Widget _title(String title) {
  return Card(
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.0),
      ),
    ),
  );
}

// exit group
Widget _exit(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 5.0
    ),
    child: RaisedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        '退出团队',
        style: TextStyle(fontSize: 20)
      ),
    ),
  );
}
