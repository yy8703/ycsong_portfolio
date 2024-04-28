import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_state.dart';
import 'package:flutter_my_portfolio/data/clone/tab_bar_data.dart';
import 'package:flutter_my_portfolio/repository/clone_repository.dart';

class CloneCubit extends Cubit<CloneState> {
  CloneCubit({
    required this.cloneRepository,
  }) : super(
          CloneState(tapBarDataList: const [
            TapBarData(title: '컬리추천'),
            TapBarData(title: '선물랭킹'),
            TapBarData(title: '베스트'),
            TapBarData(title: '신상품'),
            TapBarData(title: '알뜰쇼핑'),
            TapBarData(title: '특가/혜택'),
          ], seletedTapBarTitle: '컬리추천'),
        );

  final CloneRepository cloneRepository;

  Future<void> tapBarOnTabEvent({required String title}) async {
    emit(state.copyWith(seletedTapBarTitle: title));
  }
}
