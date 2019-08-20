import 'package:flutter/material.dart';
import 'package:atlas/blocs/user.dart';
import 'package:atlas/navigations/args.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinGroup extends StatefulWidget {
  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  String _value = '';
  void changeValue(String value) {
    setState(() { _value = value; });
  }
  
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('加入团队')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '团队名称',
              ),
              onChanged: changeValue
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                // update groups
                _userBloc.dispatch(JoinGroupEvent(name: _value));
                Navigator.pushNamedAndRemoveUntil(
                  context, '/init', (_) => false,
                  arguments: RootArgs( index: 1 )
                );
              },
              child: const Text('加入', style: TextStyle(fontSize: 20)),
            ),
          ]
        )
      )
    );
  }
}
