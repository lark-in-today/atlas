import 'package:flutter/material.dart';
import 'package:atlas/navigations/args.dart';

class Me extends StatelessWidget {
  final List<String> info;

  const Me({
    Key key, @required this.info,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: settings(context, info)),
        ]
      )
    );
  }
}


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
        Navigator.pushNamed(
          context, '/mine/modify',
          arguments: ModifyArgs(title: title)
        );
      }
    ),
  );
}

Widget settings(BuildContext context, List<String> info) {
  List<String> titles = <String>[
    '昵称', '手机号', '邮箱'
  ];
  
  return ListView.builder(
    itemCount: info.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child: card(
          "${titles[index]}",
          "${info[index]}",
          context
        ),
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}
