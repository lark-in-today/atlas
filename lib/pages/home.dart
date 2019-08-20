import 'package:flutter/material.dart';
import 'package:atlas/navigations/args.dart';
// bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/group.dart';

class Home extends StatelessWidget {
  Home({ Key key }) : super(key: key);

  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is GroupChanged) {
          return container(context, state.topics);
          if (state.topics.length == 0) {
            return Center(child: Text('No topics now.'));
          }
        } else if(state is EmptyGroup) {
          return Center(child: Text('No topics now.'));
        } else {
          return Text('requesting...');
        }
      }
    );
  }
}

Widget container(BuildContext context, List<dynamic> topics) {
  return Container(
    child: ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0
      ),
      itemCount: topics.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: card(topics[index], context),
          
          margin: EdgeInsets.symmetric(vertical: 6.0),
        );
      },
    )
  );
}

Widget card(TopicArgs topic, BuildContext context) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          topic.title,
          style: TextStyle(fontSize: 14)
        ),
        padding: EdgeInsets.symmetric(vertical: 6.0),
      ),
      dense: true,
      onTap: () {
        Navigator.pushNamed(
          context, '/topic/topic',
          arguments: TopicArgs(title: topic.title, id: topic.id)
        );
      }
    ),
  );
}
