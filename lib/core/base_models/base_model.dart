import 'package:bookz_app/core/base_models/base_entity.dart';

class BaseModel<T> extends BaseEntity<T> {
  BaseModel({required super.count, required super.next, required super.previous, required super.results});
  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(count: json['count'] ?? 0, next: json['next'] ?? '', previous: json['previous'] ?? '', results: json['results']);
  }
  factory BaseModel.fromJsonWithModel(Map<String, dynamic> json, {required List<T> Function(List<dynamic>) fromJson}) {
    List<T> results = [];
    if (json["results"] != null) {

      results = fromJson(json["results"]);
    }
    return BaseModel(count: json['count'] ?? 0, next: json['next'] ?? '', previous: json['previous'] ?? '', results: results);
  }
}


