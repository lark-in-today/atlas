import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';
import 'package:atlas/pages/change_group.dart';
// bloc
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/blocs/user.dart';

Widget change_group() {
  return BlocProvider(
    builder: (context) => UserBloc()..dispatch(InitUser(user: '')),
    child: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInited) {
          return ChangeGroup(groups: state.groups);
        }
      }
    )
  );
}
