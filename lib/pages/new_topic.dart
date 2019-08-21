import 'package:flutter/material.dart';
import 'package:atlas/blocs/user.dart';
import 'package:atlas/blocs/group.dart';
import 'package:atlas/blocs/topic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/navigations/args.dart';

class NewTopic extends StatefulWidget {
  @override
  _NewTopicState createState() => _NewTopicState();
}

class _NewTopicState extends State<NewTopic> {
  String _title = '';
  String _content = '';

  void changeTitle(String title) {
    setState(() { _title = title; });
  }

  void changeContent(String content) {
    setState(() { _content = content; });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建话题'),
        actions: <Widget>[submit(context, _title, _content)],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '话题',
              ),
              minLines: 3,
              maxLines: 3,
              onChanged: changeTitle
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
              ),
              minLines: 5,
              maxLines: 5,
              onChanged: changeContent
            ),
          ]
        )
      ),
    );
  }
}

Widget submit(BuildContext context, String title, String content) {
  final TopicBloc _topicBloc = BlocProvider.of<TopicBloc>(context);
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, userState) {
      if (userState is UserInited) {
        return BlocBuilder<GroupBloc, GroupState>(
          builder: (context, groupState) {
            if (groupState is GroupChanged) {
              return Container(
                child: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    _topicBloc.dispatch(PostTopic(
                        title: title,
                        content: content,
                        group: groupState.name,
                        author: userState.name
                    ));
                    Navigator.pushNamedAndRemoveUntil(
                      context, '/init', (_) => false,
                      arguments: RootArgs( index: 0 )
                    );
                  }
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }
        );
      } else {
        return SizedBox.shrink();
      }
    }
  );
}
