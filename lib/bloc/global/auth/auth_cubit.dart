import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/data/user_info.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authNavigatorKey,
    required this.authRepository,
  }) : super(AuthState());

  final GlobalKey<NavigatorState> authNavigatorKey;

  final AuthRepository authRepository;

  ///로그인
  //유저 목록중 일치하는 계정 확인 및 로그인
  Future<LoginEventState> login({required String id, required String password}) async {
    for (UserInfo data in authRepository.userList ?? []) {
      if (data.id == id) {
        if (data.password == password) {
          return LoginEventState.ok;
        } else {
          return LoginEventState.wrongPassword;
        }
      }
    }

    return LoginEventState.notId;
  }
}