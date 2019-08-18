import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:atlas/api/user.dart';

// events
abstract class RegisterEvent extends Equatable {}

class SendCode extends RegisterEvent {
  final String tel;
  SendCode({this.tel});
}

class VerifyCode extends RegisterEvent {
  final String tel;
  final String code;
  VerifyCode({this.tel, this.code});
}

class Register extends RegisterEvent {
  final String tel;
  Register({this.tel});
  
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
  final String tel;
  SentCode({ this.tel }) : super([ tel ]);
  
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
      await userSms(event.tel);
      yield SentCode(tel: event.tel);
    } else if(event is VerifyCode) {
      UserSmsVerify res = await userSmsVerify(event.tel, event.code);
      yield Completed(token: res.token);
    } else if(event is StopRegister) {
      yield None();
    }
  }
}
