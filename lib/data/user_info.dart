import 'package:equatable/equatable.dart';

///유저 정보 객체
class UserInfo extends Equatable {
  const UserInfo({
    required this.id,
    required this.password,
    required this.createdAt,
    required this.findQuestion,
    required this.findAnswer,
  });

  ///아이디
  final String id;

  ///패스워드
  final String password;

  ///생성날짜
  final DateTime createdAt;

  ///찾기-질문
  final String findQuestion;

  ///찾기-대답
  final String findAnswer;

  @override
  List<Object?> get props => [
        id,
        password,
        createdAt,
        findQuestion,
        findAnswer,
      ];
}
