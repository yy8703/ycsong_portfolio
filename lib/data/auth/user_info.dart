import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/util/date_format_util.dart';

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

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      password: json['password'],
      createdAt: DateFormatUtil.YEAR_DATE_YYYY_MM_DD_HHMMSS.parse(json['createdAt']),
      findQuestion: json['findQuestion'],
      findAnswer: json['findAnswer'],
    );
  }

  static List<UserInfo> fromJsonList({required List<dynamic> jsonList}) {
    return jsonList.map((json) => UserInfo.fromJson(json as Map<String, dynamic>)).toList();
  }

  static Map<String, dynamic> toMap(UserInfo data) {
    return {
      "id": data.id,
      "password": data.password,
      "createdAt": data.createdAt.toString(),
      "findQuestion": data.findQuestion,
      "findAnswer": data.findAnswer,
    };
  }

  static List<Map<String, dynamic>> toMapList(List<UserInfo> list) {
    List<Map<String, dynamic>> result = [];

    for (UserInfo data in list) {
      result.add(toMap(data));
    }

    return result;
  }

  @override
  List<Object?> get props => [
        id,
        password,
        createdAt,
        findQuestion,
        findAnswer,
      ];
}
