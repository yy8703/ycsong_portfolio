import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/data/auth/dto/sign_up_data_dto.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_terms_page.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authNavigatorKey,
    required this.authRepository,
  }) : super(const AuthState());

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

  //회원가입 프로세스 시작,
  Future<void> moveToSignUpPage() async {
    //새로 가입을 시작해야 하므로 초기화 해주기,
    SignUpDataDTO newData = const SignUpDataDTO();
    emit(state.copyWith(signUpDataDTO: newData));

    authNavigatorKey.currentState!.pushNamedAndRemoveUntil(SignUpTermsPage.routePath, (route) => false);
  }
}
