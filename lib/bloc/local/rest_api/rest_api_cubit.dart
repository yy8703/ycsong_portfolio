import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/local/rest_api/rest_api_state.dart';
import 'package:flutter_my_portfolio/data/rest_api/address.dart';
import 'package:flutter_my_portfolio/repository/rest_api_repository.dart';

class RestApiCubit extends Cubit<RestApiState> {
  RestApiCubit({
    required this.restApiRepository,
  }) : super(RestApiState());

  final RestApiRepository restApiRepository;

  ///주소검색 이벤트
  Future<void> addressSearchEvent({required String inputAddress}) async {
    await restApiRepository.addressSearchRestAPI(address: inputAddress, page: 1);

    emit(state.copyWith(
      addressMeta: restApiRepository.addressMeta,
      addressList: restApiRepository.addressList,
    ));
  }

  ///주소검색 스크롤 이벤트
  Future<void> addressScrollSearchEvent({required String inputAddress}) async {
    int page = (state.addressMeta != null) ? state.addressMeta!.pageIndex + 1 : 1;
    await restApiRepository.addressSearchRestAPI(address: inputAddress, page: page);

    emit(state.copyWith(
      addressMeta: restApiRepository.addressMeta,
      addressList: restApiRepository.addressList,
    ));
  }

  ///주소 선택 이벤트
  Future<void> selectAddressEvent({required Address data}) async {
    emit(state.copyWith(address: data));
  }
}
