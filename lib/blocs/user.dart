import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atlas/api/user.dart';

/** User List
 * @page: ['/home']
 */
// events
abstract class UserEvent extends Equatable {}

class InitUser extends UserEvent {
  final String user;
  ChangeUser({this.user});
  
  @override
  String toString() => 'InitUser';
}

// states
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class CurrentUser extends UserState {
  final String id;
  final String name;
  final dynamic topics;
  final dynamic members;
  
  CurrentUser({
      this.id,
      this.name,
      this.topics,
      this.members,
  }) : super([ id, name, topics, members ]);
}

// bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => CurrentUser(topics: []);
  
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (event is ChangeUser) {
      UserData data = await groupData(event.group);
      
      yield CurrentUser(
        id: data.id,
        name: data.name,
        topics: data.topics,
        members: data.members
      );
      return;
    }
  }
}
