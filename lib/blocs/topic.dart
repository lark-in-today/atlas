import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atlas/api/group.dart';

// events
abstract class TopicEvent extends Equatable {}

class ChangeGroup extends TopicEvent {
  @override
  String toString() => 'Change';
}

// states
abstract class TopicState extends Equatable {
  TopicState([List props = const []]) : super(props);
}

class CurrentGroup extends TopicState {
  final dynamic topics;
  CurrentGroup({
      this.topics
  }) : super([ topics ]);
  
  @override
  String toString() => 'CurrentGroup: { topics: $topics }';
}

// bloc
class TopicBloc extends Bloc<TopicEvent, TopicState> {
  @override
  TopicState get initialState => CurrentGroup(topics: []);
  
  @override
  Stream<TopicState> mapEventToState(TopicEvent event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (event is ChangeGroup) {
      String group = prefs.getString('currentGroup') ?? '';
      GroupTopics topics = await groupTopics(group);
      
      yield CurrentGroup(topics: topics);
      return;
    }
  }
}
