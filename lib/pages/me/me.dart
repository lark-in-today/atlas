import 'package:flutter/material.dart';
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


Widget settings(List<Map> entries, BuildContext context) {
  return ListView.builder(
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child: card(
          "${entries[index]['title']}",
          "${entries[index]['value']}",
          context
        ),
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  final List<Map> settingList = <Map>[
    {
      'title': '头像',
      'value': 'x',
    }, {
      'title': '昵称',
      'value': 'noreply'
    }, {
      'title': '手机号',
      'value': '186****3929'
    }, {
      'title': '邮箱',
      'value': 'noreply@cdr.today'
    }
  ];
  
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
          Expanded(child: settings(widget.settingList, context))
        ]
      )
    );
  }
}
