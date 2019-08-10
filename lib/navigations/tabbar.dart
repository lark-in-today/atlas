import 'package:flutter/material.dart';
import 'package:atlas/pages/home.dart';
import 'package:atlas/pages/contacts.dart';
import 'package:atlas/pages/me/me.dart';

// configs
List<Widget> actions(int index, BuildContext context) {
  if (index == 0) {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/new_topic');
        },
      )
    ];
  } else if(index == 1) {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/join_group');
        },
      )
    ];
  } else {
    return [];
  }
}

List<String> titles = [
    '话题', '成员', '我的'
];

List<Widget> children = [
    Home(), Contacts(), Me(),
];

// TabNavigator
class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  
  void onTapped(int index) {
    setState(() {
        _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('${titles[_currentIndex]}'),
        actions: actions(_currentIndex, context),
      ),
      body: children[_currentIndex],
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
