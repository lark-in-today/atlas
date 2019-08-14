import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';
import './modify.dart';

Widget card(String title, String value, BuildContext context) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          title,
          style: TextStyle(fontSize: 14)
        ),
        padding: EdgeInsets.symmetric(vertical: 6.0,),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(value),
          Icon(Icons.chevron_right)
        ]
      ),
      dense: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modify(title: title)
          ),
        );
      }
    ),
  );
}

Widget settings(List<String> entries, BuildContext context) {
  List<String> titles = <String>[
    '昵称', '手机号', '邮箱'
  ];
  
  return ListView.builder(
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child: card(
          "${titles[index]}",
          "${entries[index]}",
          context
        ),
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  @override
  _Me createState() => _Me();
}

class _Me extends State<Me> {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FutureBuilder<UserInfo>(
              future: userInfo(),
              builder: (context, snapshot) {
                  if (snapshot.hasData) {
                  List<String> values = [
                    snapshot.data.name,
                    snapshot.data.tel,
                    snapshot.data.mail
                  ];
                  return settings(values, context);
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
    );
  }
}
