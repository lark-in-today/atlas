import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:atlas/api/user.dart';

// user info.
enum UserInfoEvent { update }

class UserInfoBloc extends Bloc<UserInfoEvent, Future<UserInfo>> {
  @override
  Future<UserInfo> get initialState => userInfo();

  @override
  Stream<Future<UserInfo>> mapEventToState(UserInfoEvent event) async* {
    switch (event) {
      case UserInfoEvent.update:
        yield null;
        break;
    }
  }
}
