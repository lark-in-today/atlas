import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/register.dart';

class Modify extends StatefulWidget {
  final String title;
  final String index;
  Modify({
      Key key,
      @required this.title,
      @required this.index
  }) : super(key: key);
  
  @override
  _ModifyState createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  String _value = '';
  void changeValue(String value) {
    setState(() { _value = value; });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[ok(context, widget.index, _value)]
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: changeValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: widget.title,
              ),
            ),
          ]
        )
      ),
    );
  }
}

// login-modify
Widget ok(BuildContext context, String index, String value) {
  return BlocBuilder<RegisterBloc, RegisterState>(
    builder: (context, state) {
      if (index == 'tel') {
        return _tel(context, index, value);
      }
      return Text('hello, world!');
    }
  );
}

Widget _tel(BuildContext context, String index, String value) {
  RegisterBloc _registerBloc = BlocProvider.of<RegisterBloc>(context);
  return Container(
    child: IconButton(
      icon: Icon(Icons.check),
      onPressed: () {
        _registerBloc.dispatch(SendCode(tel: value));
        Navigator.pushNamed(context, '/mine/modify/sms');
      }
    ),
  );
}
