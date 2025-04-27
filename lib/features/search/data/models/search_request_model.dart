import '../../domain/entities/search_request_entity.dart';

class SearchRequestModel extends SearchRequestEntity {
  SearchRequestModel({required super.keyword, required super.pageNumber});

  Map<String, dynamic> toJson() => {'search': keyword, 'page': pageNumber};
}
