import 'dart:convert';

import 'package:flutter_my_portfolio/data/user_info.dart';
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
    List<dynamic> data = json.decode(sp.getString('usersData') ?? '');

    userList = UserInfo.fromJsonList(jsonList: data);
  }

  Future<void> saveUserInfoList() async {
    sp.setString('usersData', json.encode(userList));
  }
}
