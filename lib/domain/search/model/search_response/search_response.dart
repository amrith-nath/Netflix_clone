import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: '')
  List<Result>? results;

  SearchResponse({
    this.results,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
