import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';

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

Widget _column(BuildContext context, GroupCurrent data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      _title(data.name),
      Divider(),
      _exit(context)
    ]
  );
}

// main
class GroupInfo extends StatelessWidget {
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
        child: FutureBuilder<GroupCurrent>(
          future: groupCurrent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _column(context, snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          }
        )
      ),
    );
  }
}
