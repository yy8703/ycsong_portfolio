import 'dart:convert';

import 'package:flutter_my_portfolio/data/rest_api/address.dart';
import 'package:flutter_my_portfolio/data/rest_api/address_meta.dart';
import 'package:http/http.dart' as http;

class RestApiRepository {
  List<Address>? addressList;
  AddressMeta? addressMeta;

  Future<void> addressSearchRestAPI({required String address, required int page}) async {
    Map<String, dynamic>? ret;
    int page0 = page;
    if (addressMeta != null && addressMeta!.inputAddress != address) {
      page0 = 1;
    }

    Uri uri = Uri.https('dapi.kakao.com', '/v2/local/search/address.json', {'query': address, 'page': '$page0', 'size': '30'});
    http.Response response = await http.get(uri, headers: {'Authorization': 'KakaoAK 64367cc0cd836a6c6322d17cd598e5d4'});
    ret = jsonDecode(response.body);

    if (ret != null) {
      if (addressMeta != null && addressMeta!.inputAddress == address) {
        addressMeta = AddressMeta.fromJson(json: ret['meta'], pageIndex: page, inputAddress: address);
        if (page > 1 && addressList != null) {
          List<Address> addressList = Address.fromJsonList(jsonArray: ret['documents']);
          addressList.addAll(addressList);
        } else {
          addressList = Address.fromJsonList(jsonArray: ret['documents']);
        }
      } else {
        addressMeta = AddressMeta.fromJson(json: ret['meta'], pageIndex: page, inputAddress: address);
        addressList = Address.fromJsonList(jsonArray: ret['documents']);
      }
    }

    return;
  }
}
