import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/util/date_format_util.dart';

class SearchImageData extends Equatable {
  const SearchImageData({
    required this.collection,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.displaySiteName,
    required this.docUrl,
    required this.width,
    required this.height,
    required this.datetime,
  });

  final String collection;
  final String thumbnailUrl;
  final String imageUrl;
  final String displaySiteName;
  final String docUrl;
  final int width;
  final int height;
  final DateTime datetime;

  factory SearchImageData.fromJson({required Map<String, dynamic> json}) {
    return SearchImageData(
      collection: json['collection'],
      thumbnailUrl: json['thumbnail_url'],
      imageUrl: json['image_url'],
      displaySiteName: json['display_sitename'],
      docUrl: json['doc_url'],
      width: json['width'],
      height: json['height'],
      datetime: DateFormatUtil.YEAR_DATE_YYYY_MM_DD_HHMMSSZ.parse(json['datetime']),
    );
  }

  static List<SearchImageData> fromJsonList({required List<dynamic> jsonArray}) {
    return [
      for (dynamic json in jsonArray) SearchImageData.fromJson(json: json as Map<String, dynamic>),
    ];
  }

  static Map<String, dynamic> toMap(SearchImageData data) {
    return {
      'collection': data.collection,
      'thumbnail_url': data.thumbnailUrl,
      'image_url': data.imageUrl,
      'display_sitename': data.displaySiteName,
      'doc_url': data.docUrl,
      'width': data.width,
      'height': data.height,
      'datetime': DateFormatUtil.YEAR_DATE_YYYY_MM_DD_HHMMSSZ.format(data.datetime),
    };
  }

  static List<Map<String, dynamic>> toMapList(List<SearchImageData> list) {
    List<Map<String, dynamic>> result = [];

    for (SearchImageData data in list) {
      result.add(toMap(data));
    }

    return result;
  }

  @override
  List<Object?> get props => [
        collection,
        thumbnailUrl,
        imageUrl,
        displaySiteName,
        docUrl,
        width,
        height,
        datetime,
      ];
}
