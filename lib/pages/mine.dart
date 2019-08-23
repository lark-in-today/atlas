import 'package:flutter/material.dart';
import 'package:atlas/navigations/args.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/user.dart';

class Mine extends StatelessWidget {
  const Mine({ Key key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserUnInited) {
            /// if user uninited
            /// return only tel card
            return Center(child: Text('network error 🤨'));
          } else if (state is UserInited) {
            return settings(context, state);
          } else if (state is UserUpdated) {
            return settings(context, state);
          }
        },
      )
    );
  }
}

Widget settings(BuildContext context, dynamic info) {
  List<ModifyArgs> titles = <ModifyArgs>[
    ModifyArgs(
      title: '昵称',
      index: 'name'
    ),
    ModifyArgs(
      title: '邮箱',
      index: 'mail'
    )
  ];

  Map _info = {
    'mail': info.mail,
    'name': info.name
  };

  // if user not login;
  if (info.tel == '') {
    titles = <ModifyArgs>[ModifyArgs(title: '邮箱', index: 'mail')];
    _info = { 'mail': info.mail };
  }
  
  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (BuildContext context, int index) {
      String _key = titles[index].index;
      return Container(
        child: card(titles[index], "${_info[_key]}", context),
        margin: EdgeInsets.symmetric(vertical: 5.0),
      );
    },
  );
}

Widget card(ModifyArgs args, String value, BuildContext context) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          args.title,
          style: TextStyle(fontSize: 14)
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0),
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
