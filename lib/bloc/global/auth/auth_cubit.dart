import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authNavigatorKey,
    required this.authRepository,
  }) : super(AuthState());

  final GlobalKey<NavigatorState> authNavigatorKey;

  final AuthRepository authRepository;
}
