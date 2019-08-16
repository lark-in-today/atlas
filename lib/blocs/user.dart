import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:atlas/api/user.dart';

/** User List
 * @page: ['/home']
 */
// events
abstract class UserEvent extends Equatable {}

class InitUser extends UserEvent {
  final String user;
  InitUser({this.user});
  
  @override
  String toString() => 'InitUser';
}

// states
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class CurrentUser extends UserState {
  final String tel;
  final String name;
  final String mail;
  final dynamic groups;
  
  CurrentUser({
      this.tel,
      this.name,
      this.mail,
      this.groups,
  }) : super([ tel, name, mail, groups ]);
}

// bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => CurrentUser(
    tel: '',
    name: '',
    mail: '',
    groups: []
  );
  
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is InitUser) {
      UserInfo info = await userInfo(event.user);
      yield CurrentUser(
        tel: info.tel,
        name: info.name,
        mail: info.mail,
        groups: info.groups
      );
      return;
    }
  }
}
