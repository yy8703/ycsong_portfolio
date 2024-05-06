import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/reg_exp_state.dart';
import 'package:flutter_my_portfolio/data/auth/dto/sign_up_data_dto.dart';

class AuthState extends Equatable {
  const AuthState({
    this.signUpDataDTO,
    this.idRegExpState,
    this.passwordRegExpState,
    this.findDataRegExpState,
  });

  final SignUpDataDTO? signUpDataDTO;
  final RegExpState? idRegExpState;
  final RegExpState? passwordRegExpState;
  final RegExpState? findDataRegExpState;

  AuthState copyWith({
    SignUpDataDTO? signUpDataDTO,
    RegExpState? idRegExpState,
    RegExpState? passwordRegExpState,
    RegExpState? findDataRegExpState,
  }) {
    return AuthState(
      signUpDataDTO: signUpDataDTO ?? this.signUpDataDTO,
      idRegExpState: idRegExpState ?? this.idRegExpState,
      passwordRegExpState: passwordRegExpState ?? this.passwordRegExpState,
      findDataRegExpState: findDataRegExpState ?? this.findDataRegExpState,
    );
  }

  @override
  List<Object?> get props => [
        signUpDataDTO,
        idRegExpState,
        passwordRegExpState,
        findDataRegExpState,
      ];
}
