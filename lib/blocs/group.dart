import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atlas/api/group.dart';

/** Group List
 * @page: ['/home']
 */
// events
abstract class GroupEvent extends Equatable {}

class ChangeGroup extends GroupEvent {
  final String group;
  ChangeGroup({this.group});
  
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
  final String id;
  final String name;
  final dynamic topics;
  final dynamic members;
  
  GroupChanged({
      this.id,
      this.name,
      this.topics,
      this.members,
  }) : super([ id, name, topics, members ]);
}

// bloc
class GroupBloc extends Bloc<GroupEvent, GroupState> {
  @override
  GroupState get initialState => GroupUnInited();
  
  @override
  Stream<GroupState> mapEventToState(GroupEvent event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (event is ChangeGroup) {
      GroupData data = await groupData(event.group);
      
      yield GroupChanged(
        id: data.id,
        name: data.name,
        topics: data.topics,
        members: data.members
      );
      return;
    }
  }
}
