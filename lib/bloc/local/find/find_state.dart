import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';

class FindState extends Equatable {
  const FindState({
    this.selectdUserInfo,
  });

  final UserInfo? selectdUserInfo;

  FindState copyWith({
    UserInfo? selectdUserInfo,
  }) {
    return FindState(
      selectdUserInfo: selectdUserInfo ?? this.selectdUserInfo,
    );
  }

  @override
  List<Object?> get props => [
        selectdUserInfo,
      ];
}
