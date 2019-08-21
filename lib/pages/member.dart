import 'package:flutter/material.dart'; 

class Member extends StatelessWidget {
  final String name;
  final String mail;

  Member({ this.name, this.mail });
    
  Widget build(BuildContext context) {
    final List<dynamic> settingList = <dynamic>[{
        'key': '昵称',
        'value': name
      }, {
        'key': '邮箱',
        'value': mail
    }];
    
    return Scaffold(
      appBar: AppBar(title: Text('个人信息')),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: settings(settingList))
          ]
        )
      )
    );
  }
}

Widget settings(List<dynamic> entries) {
  return ListView.builder(
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child:  card(entries[index]),
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}

Widget card(dynamic info) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          info['key'],
          style: TextStyle(
            fontSize: 14
          )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 6.0,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(info['value']),
          Icon(Icons.chevron_right)
        ]
      ),
      dense: true,
    ),
  );
}

