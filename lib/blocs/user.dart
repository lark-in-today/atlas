import 'package:bloc/bloc.dart';
import 'package:atlas/api/user.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// User List
/// @page: ['/home']
// events
abstract class UserEvent extends Equatable {}

class InitUser extends UserEvent {
  final String user;
  InitUser({this.user});
  
  @override
  String toString() => 'InitUser';
}

class UpdateUser extends UserEvent {
  final String name;
  final String mail;
  UpdateUser({ this.name, this.mail });
}

// states
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class UserUnInited extends UserState {
  @override
  String toString() => 'UserUnInited';
}

class UserInited extends UserState {
  final String tel;
  final String name;
  final String mail;
  final dynamic groups;
  
  UserInited({
      this.tel,
      this.name,
      this.mail,
      this.groups,
  }) : super([ tel, name, mail, groups ]);
}

class UserUpdated extends UserState {
  final String tel;
  final String name;
  final String mail;
  final dynamic groups;
  
  UserUpdated({
      this.tel,
      this.name,
      this.mail,
      this.groups,
  }) : super([ tel, name, mail, groups ]);
}

// bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserUnInited();
  
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is InitUser) {
      UserInfo info = await userInfo(event.user);
      yield UserInited(
        tel: info.tel,
        name: info.name,
        mail: info.mail,
        groups: info.groups
      );
      return;
    } else if(event is UpdateUser) {
      if (event.mail == null) {
        UserInfo info = await userUpdate('name', event.name);
        yield UserUpdated(
          tel: info.tel,
          name: info.name,
          mail: info.mail,
          groups: info.groups
        );
      } else {
        UserInfo info = await userUpdate('mail', event.mail);
        yield UserUpdated(
          tel: info.tel,
          name: info.name,
          mail: info.mail,
          groups: info.groups
        );
      }
    }
  }
}
