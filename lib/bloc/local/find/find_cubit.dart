import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/local/find/find_state.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';

///찾기 기능 전용 큐빗
class FindCubit extends Cubit<FindState> {
  FindCubit({
    required this.authRepository,
  }) : super(const FindState());

  final AuthRepository authRepository;

  Future<void> userselectEvent({UserInfo? data}) async {
    FindState newState = FindState(selectdUserInfo: data);

    emit(newState);
  }

  Future<bool> answerCheck({required String str}) async {
    //선택한 유저 정보와, 입력한 답안을 체크한다
    if (state.selectdUserInfo?.findAnswer == str) {
      return true;
    }

    return false;
  }

  //비밀번호 찾기시 아이디 검증
  Future<bool> findPasswordIdCheck({required String str}) async {
    for (UserInfo data in authRepository.userList ?? []) {
      if (data.id == str) {
        return true;
      }
    }

    return false;
  }
}
