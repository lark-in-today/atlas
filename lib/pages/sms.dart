import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/register.dart';

class Sms extends StatefulWidget {
  Sms({ Key key }) : super(key: key);
  
  @override
  _SmsState createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  String _value = '';
  void changeValue(String value) {
    setState(() { _value = value; });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('获取验证码'),
        actions: <Widget>[ok(context, _value)]
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
                labelText: '验证码',
              ),
            ),
          ]
        )
      ),
    );
  }
}

// login-modify
Widget ok(BuildContext context, String value) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<RegisterBloc>(builder: (context) => RegisterBloc()),
    ],
    child: BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is SentCode) {
          return _ok(context, state.tel, value);
        } else {
          return SizedBox.shrink();
        }
      }
    )
  );
}

Widget _ok(BuildContext context, String tel, String value) {
  RegisterBloc _registerBloc = BlocProvider.of<RegisterBloc>(context);
  return Container(
    child: IconButton(
      icon: Icon(Icons.check),
      onPressed: () {
        _registerBloc.dispatch(VerifyCode(
            tel: tel, code: value
        ));
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      }
    ),
  );
}
