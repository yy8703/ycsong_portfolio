import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/search/search_state.dart';
import 'package:flutter_my_portfolio/data/search/search_image_data.dart';
import 'package:flutter_my_portfolio/data/search/search_image_meta.dart';
import 'package:flutter_my_portfolio/repository/search_repository.dart';
import 'package:flutter_my_portfolio/ui/pages/search_rest_api/image_view_page.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.searchRepository,
  }) : super(const SearchState(isSearching: false));

  final SearchRepository searchRepository;

  //검색 이벤트
  Future<void> searchEvent({required String searchStr}) async {
    emit(state.copyWith(isSearching: true));

    await searchRepository.imageSearchRestAPI(searchStr: searchStr, page: 1);

    emit(state.copyWith(searchImageDataList: searchRepository.imageDataList, isSearching: false));
  }

  //인피니티 스크롤 이벤트
  Future<void> scrollSearchEvent({required String searchStr}) async {
    emit(state.copyWith(isSearching: true));

    int page = (searchRepository.searchImageMeta != null) ? searchRepository.searchImageMeta!.pageIndex + 1 : 1;

    await searchRepository.imageSearchRestAPI(searchStr: searchStr, page: page);

    emit(state.copyWith(searchImageDataList: searchRepository.imageDataList, isSearching: false));
  }

  //즐겨찾기 이벤트 + 로컬 캐시 저장
  Future<void> favoritesEvent({required SearchImageData data}) async {
    List<SearchImageData> result = List.of(state.favoritesDataList ?? []);

    if (result.contains(data)) {
      result.remove(data);
    } else {
      result.add(data);
    }

    //비동기 세이브
    searchRepository.saveFavoritesDataList(list: result);

    emit(state.copyWith(favoritesDataList: result));
  }

  //로컬 캐시에서 가져오기
  Future<void> getFavoritesData() async {
    await searchRepository.getFavoritesList();

    emit(state.copyWith(favoritesDataList: searchRepository.favoritesDataList));
  }

  Future<void> viewFullImageEvent({required SearchImageData data}) async {
    emit(state.copyWith(fullImageData: data));
  }

  //검색을 한번도 안했다면, null
  SearchImageMeta? get searchImageMeta => searchRepository.searchImageMeta;
}
