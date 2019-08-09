import 'package:flutter/material.dart';

Widget card(String title) {
  return Card(
    child: ListTile(
      title: Container(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14
          )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 6.0,
        ),
      ),
      dense: true,
    ),
  );
}
