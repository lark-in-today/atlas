import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';
import 'package:atlas/pages/change_group.dart';

Widget change_group() {
  return FutureBuilder<UserGroup>(
    future: userGroup(''),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ChangeGroup(
          groups: snapshot.data.groups
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return CircularProgressIndicator();
    }
  );
}
