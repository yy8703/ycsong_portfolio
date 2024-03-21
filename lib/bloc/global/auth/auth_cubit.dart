import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/reg_exp_state.dart';
import 'package:flutter_my_portfolio/data/auth/dto/sign_up_data_dto.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_id_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_password_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_terms_page.dart';
import 'package:flutter_my_portfolio/util/reg_exp_format.dart';

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

    authNavigatorKey.currentState!.pushNamed(SignUpTermsPage.routePath);
  }

  //약관동의 > 아이디 생성
  Future<void> moveToMakeIdPage() async {
    authNavigatorKey.currentState!.pushNamed(SignUpIdPage.routePath);
  }

  //아이디 >> 비밀번호
  Future<void> moveToMakePasswordPage() async {
    authNavigatorKey.currentState!.pushNamed(SignUpPasswordPage.routePath);
  }

  Future<void> termsAcceptEvent({required bool value, required int index}) async {
    if (state.signUpDataDTO != null) {
      SignUpDataDTO newData = ((index == 1)) ? state.signUpDataDTO!.copyWith(isTerms1: value) : state.signUpDataDTO!.copyWith(isTerms2: value);
      emit(state.copyWith(signUpDataDTO: newData));
    } else {
      emit(state.copyWith(signUpDataDTO: const SignUpDataDTO()));
    }
  }

  Future<void> idOnChangedEvent({String? value}) async {
    RegExpState result = RegExpFormat.idRegularExpressionCheck(id: value);

    emit(state.copyWith(idRegExpState: result));
  }

  Future<bool> idOverLapEvent({required String value}) async {
    bool result = false;
    List<UserInfo> list = authRepository.userList ?? [];

    for (UserInfo info in list) {
      if (info.id == value) {
        //아이디 중복됨
        return result;
      }
    }

    result = true;
    SignUpDataDTO? newData = state.signUpDataDTO?.copyWith(isIdOverLap: result);
    emit(state.copyWith(signUpDataDTO: newData));

    return result;
  }
}
