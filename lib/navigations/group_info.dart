import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';
import 'package:atlas/pages/group_info.dart';

Widget group_info() {
  return FutureBuilder<GroupCurrent>(
    future: groupCurrent(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GroupInfoPage(name: snapshot.data.name);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return CircularProgressIndicator();
    }
  );
}
