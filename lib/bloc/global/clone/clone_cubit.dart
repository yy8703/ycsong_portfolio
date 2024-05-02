import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_state.dart';
import 'package:flutter_my_portfolio/data/clone/tab_bar_data.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/repository/clone_repository.dart';

class CloneCubit extends Cubit<CloneState> {
  CloneCubit({
    required this.cloneRepository,
  }) : super(
          CloneState(
            tapTitle: TapTitle.Main,
            tapBarDataList: const [
              TapBarData(order: 1, title: '컬리추천', tapTitle: TapTitle.Main),
              TapBarData(order: 2, title: '선물랭킹', tapTitle: TapTitle.GiftRanking),
              TapBarData(order: 3, title: '베스트', tapTitle: TapTitle.Best),
              TapBarData(order: 4, title: '신상품', tapTitle: TapTitle.NewProduct),
              TapBarData(order: 5, title: '알뜰쇼핑', tapTitle: TapTitle.AffordableShopping),
              TapBarData(order: 6, title: '특가/혜택', tapTitle: TapTitle.SpecialOffer_Benefit),
            ],
            popUpDataList: cloneRepository.popUpDataList,
            popUpViewIndex: cloneRepository.popUpDataList.first.order,
            itemDataList: cloneRepository.itemDataList,
          ),
        );

  final CloneRepository cloneRepository;

  Future<void> tapChangeEvent({required int value}) async {
    TapTitle result = TapTitle.Main;

    switch (value) {
      case 1:
        result = TapTitle.Main;
        break;
      case 2:
        result = TapTitle.GiftRanking;
        break;
      case 3:
        result = TapTitle.Best;
        break;
      case 4:
        result = TapTitle.NewProduct;
        break;
      case 5:
        result = TapTitle.AffordableShopping;
        break;
      case 6:
        result = TapTitle.SpecialOffer_Benefit;
        break;
    }

    emit(state.copyWith(tapTitle: result));
  }

  Future<void> popUpChangeEvent({required int index}) async {
    emit(state.copyWith(popUpViewIndex: index));
  }
}
