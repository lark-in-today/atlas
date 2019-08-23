import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:atlas/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

// events
abstract class RegisterEvent extends Equatable {}

class SendCode extends RegisterEvent {
  final String mail;
  SendCode({this.mail});
}

class VerifyCode extends RegisterEvent {
  final String mail;
  final String code;
  VerifyCode({this.mail, this.code});
}

class Register extends RegisterEvent {
  final String mail;
  Register({this.mail});
  
  @override
  String toString() => 'Register';
}

class StopRegister extends RegisterEvent {
  @override
  String toString() => 'StopRegister';
}

// states
abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super(props);
}

class None extends RegisterState {
  @override
  String toString() => 'None';
}

class SentCode extends RegisterState {
  final String mail;
  SentCode({ this.mail }) : super([ mail ]);
  
  @override
  String toString() => 'SentCode';
}

class Completed extends RegisterState {
  final String token;
  Completed({ this.token }) : super([ token ]);

  @override
  String toString() => 'Completed';
}

// bloc
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => None();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SendCode) {
      await userSms(event.mail);
      yield SentCode(mail: event.mail);
    } else if(event is VerifyCode) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      UserSmsVerify res = await userSmsVerify(event.mail, event.code);

      prefs.setString('token', res.token);
      prefs.setString('mail', event.mail);

      yield Completed(token: res.token);
    } else if(event is StopRegister) {
      yield None();
    }
  }
}
