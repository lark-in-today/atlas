import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:atlas/api/user.dart';

// events
abstract class RegisterEvent extends Equatable {}

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

class SendRequest extends RegisterState {
  @override
  String toString() => 'SendRequest';
}

class Completed extends RegisterState {
  final bool msg;
  Completed({
      this.msg
  }) : super([ msg ]);

  @override
  String toString() => 'Completed';
}

// bloc
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => None();
  
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is Register) {
      yield SendRequest();
      print(event.tel);
      
      yield Completed(msg: true);
      
    } else if(event is StopRegister) {
      yield None();
      
    }
    return;
  }
}
