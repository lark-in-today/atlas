import 'package:flutter/material.dart';



class GroupInfo extends StatefulWidget {
  GroupInfo({Key key}) : super(key: key);

  @override
  _GroupInfo createState() => _GroupInfo();
}

class _GroupInfo extends State<GroupInfo> {
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
            Card(
              child: ListTile(
                title: const Text(
                  'The Velvet Goldmine',
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                ),
              ),
            ),
            Divider(),
            // Card(
            //   child: Container(
            //     height: 100,
            //     padding: EdgeInsets.all(20.0),
            //     child: Center(
            //       child: Text('这里是团队简介'),
            //     )
            //   ),
            // ),
            // Divider(),
            Container(
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
            )
          ]
        )
      ),
    );
  }
}
