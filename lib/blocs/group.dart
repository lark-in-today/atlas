import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atlas/api/group.dart';
import './user.dart';

/// Group List
///@page: ['/home']
// events
abstract class GroupEvent extends Equatable {}

class ChangeGroup extends GroupEvent {
  final String name;
  ChangeGroup(this.name);
  
  @override
  String toString() => 'ChangeGroup';
}

// states
abstract class GroupState extends Equatable {
  GroupState([List props = const []]) : super(props);
}

class GroupUnInited extends GroupState {
  @override
  String toString() => 'GroupUnInited';
}

class GroupChanged extends GroupState {
  final String name;
  final dynamic topics;
  final dynamic members;
  
  GroupChanged({
      this.name,
      this.topics,
      this.members,
  }) : super([ name, topics, members ]);
}

// bloc
class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final UserBloc userBloc;
  StreamSubscription userBlocSubscription;

  GroupBloc(this.userBloc) {
    userBlocSubscription = userBloc.state.listen((state){
        if (state is UserInited) {
          this.dispatch(ChangeGroup(state.groups[0]));
        }
    });
  }
  
  @override
  GroupState get initialState => GroupUnInited();
  
  @override
  Stream<GroupState> mapEventToState(GroupEvent event) async* {
    if (event is ChangeGroup) {
      GroupData data = await groupData(event.name);
      
      yield GroupChanged(
        name: data.name,
        topics: data.topics,
        members: data.members
      );
      return;
    }
  }
}
