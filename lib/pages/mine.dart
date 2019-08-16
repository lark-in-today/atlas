import 'package:flutter/material.dart';
import 'package:atlas/navigations/args.dart';

class Mine extends StatelessWidget {
  const Mine({ Key key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    dynamic info = {
      'tel': '',
      'mail': '',
      'name': ''
    };
    
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


Widget card(ModifyArgs args, String value, BuildContext context) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          args.title,
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
          arguments: ModifyArgs(
            title: args.title,
            index: args.index
          )
        );
      }
    ),
  );
}

Widget settings(BuildContext context, dynamic info) {
  List<ModifyArgs> titles = <ModifyArgs>[
    ModifyArgs(
      title: '昵称',
      index: 'name'
    ),
    ModifyArgs(
      title: '手机号',
      index: 'tel'
    ),
    ModifyArgs(
      title: '邮箱',
      index: 'mail'
    )
  ];

  Map _info = {
    'mail': info['mail'], 'name': info['name'], 'tel': info['tel']
  };

  if (info['tel'] == '') {
    titles = <ModifyArgs>[
      ModifyArgs(title: '手机号', index: 'tel')
    ];

    _info = { 'tel': info['tel'] };
  }
  
  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (BuildContext context, int index) {
      String _key = titles[index].index;
      return Container(
        child: card(
          titles[index],
          "${_info[_key]}",
          context
        ),
        margin: EdgeInsets.symmetric(vertical: 6.0),
      );
    },
  );
}
