import 'package:flutter/material.dart';
import 'package:atlas/api/group.dart';
import 'package:atlas/pages/group_info.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/group.dart';

Widget group_info(String name) {
 return BlocProvider(
    builder: (context) => GroupBloc()..dispatch(
      ChangeGroup(group: '')
    ),
    child: BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is CurrentGroup) {
          if (state.name != null) {
            return GroupInfoPage(name: state.name);
          } else {
            return Text('hello');
          }
        }
      }
    )
  );
}
