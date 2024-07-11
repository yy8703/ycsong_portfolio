import 'dart:convert';

import 'package:flutter_my_portfolio/data/search/search_image_data.dart';
import 'package:flutter_my_portfolio/data/search/search_image_meta.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  List<SearchImageData>? imageDataList;
  List<SearchImageData>? favoritesDataList;
  SearchImageMeta? searchImageMeta;
  late SharedPreferences sp;

  Future<void> imageSearchRestAPI({required String searchStr, required int page}) async {
    Map<String, dynamic>? ret;

    int index = page;
    if (searchImageMeta != null && searchImageMeta!.searchStr != searchStr) {
      index = 1;
    }

    Uri uri = Uri.https('dapi.kakao.com', '/v2/search/image', {'query': searchStr, 'sort': 'accuracy', 'page': '$index', 'size': '30'});
    http.Response response = await http.get(uri, headers: {'Authorization': 'KakaoAK 64367cc0cd836a6c6322d17cd598e5d4'});
    ret = jsonDecode(response.body);

    if (ret != null) {
      //성공
      if (searchImageMeta != null && searchImageMeta!.searchStr == searchStr) {
        //이전 검색기록 있음 + 같은 검색어 == 인피니티 스크롤
        searchImageMeta = SearchImageMeta.fromJson(json: ret['meta'], index: index, str: searchStr);
        if (page > 1 && imageDataList != null) {
          //다음 페이지 데이터
          List<SearchImageData> newImageDataList = SearchImageData.fromJsonList(jsonArray: ret['documents']);
          imageDataList!.addAll(newImageDataList);
        } else {
          //현재 데이터 없음, 검색한 결과 넣기
          imageDataList = SearchImageData.fromJsonList(jsonArray: ret['documents']);
        }
      } else {
        //첫 검색
        searchImageMeta = SearchImageMeta.fromJson(json: ret['meta'], index: index, str: searchStr);
        imageDataList = SearchImageData.fromJsonList(jsonArray: ret['documents']);
      }
    } else {
      //실패
    }
  }

  //로컬 캐시에 저장
  Future<void> saveFavoritesDataList({required List<SearchImageData> list}) async {
    List<Map<String, dynamic>> data = SearchImageData.toMapList(list);
    sp = await SharedPreferences.getInstance();
    sp.setString('favorites', json.encode(data));
  }

  //로컬 캐시에서 즐겨찾기 데이터 가져오기
  Future<void> getFavoritesList() async {
    List<dynamic> data = [];
    try {
      sp = await SharedPreferences.getInstance();
      data = json.decode(sp.getString('favorites')!);
      favoritesDataList = SearchImageData.fromJsonList(jsonArray: data);
    } catch (e) {
      //앱캐시에 저장된게 없을때
      logger.e('not Data');
    }
  }
}
