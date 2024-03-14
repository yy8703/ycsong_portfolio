import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';

class SignUpDataDTO extends Equatable {
  const SignUpDataDTO({
    this.userInfo,
    this.isTerms1,
    this.isTerms2,
  });

  ///회원가입시 유저가 입력한 정보
  final UserInfo? userInfo;

  ///이용약관 1번
  final bool? isTerms1;

  ///이용약관 2번
  final bool? isTerms2;

  @override
  List<Object?> get props => [
        userInfo,
        isTerms1,
        isTerms2,
      ];
}