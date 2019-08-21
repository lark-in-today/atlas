import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:atlas/api/topic.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// -------- events ----------
abstract class TopicEvent extends Equatable {}

class PostTopic extends TopicEvent {
  final String title;
  final String content;
  final String group;
  final String author;

  PostTopic({
      this.title,
      this.content,
      this.group,
      this.author
  });

  @override
  String toString() => 'PostTopic { title: $title, content: $content, group: $group, author: $author}';
}


// -------- states ----------
abstract class TopicState extends Equatable {
  TopicState([List props = const []]) : super(props);
}

class TopicUnInited extends TopicState {
  @override
  String toString() => 'TopicUnInited';
}

class TopicCreated extends TopicState {
  final String msg;

  TopicCreated({this.msg});
}

// --------- bloc -------------
class TopicBloc extends Bloc<TopicEvent, TopicState> {
  @override
  TopicState get initialState => TopicUnInited();

  @override
  Stream<TopicState> mapEventToState(TopicEvent event) async* {
    if (event is PostTopic) {
      TopicCreateAPI res = await topicCreate(
        title: event.title,
        content: event.content,
        group: event.group,
        author: event.author
      );
      yield TopicCreated(msg: res.msg);
    }
    return;
  }
}
