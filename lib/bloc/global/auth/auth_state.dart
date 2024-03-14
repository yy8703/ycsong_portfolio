import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/auth/dto/sign_up_data_dto.dart';

class AuthState extends Equatable {
  const AuthState({
    this.signUpDataDTO,
  });

  final SignUpDataDTO? signUpDataDTO;

  AuthState copyWith({
    SignUpDataDTO? signUpDataDTO,
  }) {
    return AuthState(
      signUpDataDTO: signUpDataDTO ?? this.signUpDataDTO,
    );
  }

  @override
  List<Object?> get props => [
        signUpDataDTO,
      ];
}
