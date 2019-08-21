import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';
import 'package:atlas/pages/member.dart';
import 'package:atlas/navigations/args.dart';

Widget member(MemberArgs args) {
  return FutureBuilder<UserThum>(
    future: userThum(args.name),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        print(snapshot.data);
        return Member(
          name: snapshot.data.name,
          mail: snapshot.data.mail
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    }
  );
}
