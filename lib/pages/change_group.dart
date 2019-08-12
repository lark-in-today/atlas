import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';

Widget groupList(List<dynamic> entries) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 10.0),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text(
            "${entries[index]['name']}",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          dense: true,
          trailing: null,
          enabled: true,
          onTap: () { Navigator.pop(context); }
        ),
      );
    },
  );
}

class ChangeGroup extends StatefulWidget {
  ChangeGroup({Key key}) : super(key: key);

  @override
  _ChangeGroup createState() => _ChangeGroup();
}

class _ChangeGroup extends State<ChangeGroup> {
  final List<String> contacts = <String>[
    'The Beatles',
    'Pink Floyd', 'King Crimson', 'Resistance'
  ];
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切换团队'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: FutureBuilder<UserGroup>(
                future: userGroup(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return groupList(snapshot.data.groups);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                }
              )
            ),
            // first child
          ]
        )
      ),
    );
  }
}
