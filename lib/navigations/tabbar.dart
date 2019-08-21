import 'package:flutter/material.dart';
import 'package:atlas/pages/home.dart';
import 'package:atlas/pages/contacts.dart';
import 'package:atlas/pages/mine.dart';
// blocs
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/user.dart';
import 'package:atlas/blocs/group.dart';

// configs
dynamic configs(BuildContext context) => [{
    'title': Text('话题'),
    'child': Home(),
    'actions': [
      BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state is EmptyGroup) {
            return SizedBox.shrink();
          } else {
            return IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/topic/new_topic');
              },
            );
          }
        }
      )
    ],
  }, {
    'title': Text('成员'),
    'child': Contacts(),
    'actions': [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/contacts/join_group');
        },
      )
    ]
  }, {
    'title': Text('我的'),
    'child': Mine(),
    'actions': [
      SizedBox.shrink()
    ]
}];

// TabNavigator
class TabNavigator extends StatefulWidget {
  final int index;
  TabNavigator({Key key, @required this.index}) : super(key: key);
  
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  UserBloc _userBloc;
  GroupBloc _groupBloc;

  int _currentIndex = 0;
  void onTapped(int index) {
    setState(() { _currentIndex = index;});
  }
  
  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.dispatch(InitUser());

    _currentIndex = widget.index;
  }

  // if args
  @override
  Widget build(BuildContext context) {
    dynamic conf = configs(context);

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: conf[_currentIndex]['title'],
        actions: conf[_currentIndex]['actions'],
      ),
      body: conf[_currentIndex]['child'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('')
          )
        ],
      ),
    );
  }
}
