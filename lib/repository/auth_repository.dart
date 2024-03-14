import 'dart:convert';

import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthRepository() {
    authRepositoryInit();
  }
  List<UserInfo>? userList;
  late SharedPreferences sp;

  Future<void> authRepositoryInit() async {
    sp = await SharedPreferences.getInstance();
  }

  Future<void> getUserInfoList() async {
    List<dynamic> data = [];
    try {
      data = json.decode(sp.getString('usersData') ?? '');
    } catch (e) {
      //앱캐시에 저장한게 없다면 에러가남,
      logger.e('not user Data');
    }

    userList = UserInfo.fromJsonList(jsonList: data);
  }

  Future<void> saveUserInfoList() async {
    sp.setString('usersData', json.encode(userList));
  }
}
