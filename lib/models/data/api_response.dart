import 'package:json_annotation/json_annotation.dart';
import 'package:talian_test_app/models/data/movies.dart';

part 'api_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiResponse {
  ApiResponse({
     this.page,
     this.results,
     this.totalResults,
     this.totalPages,
  });

  final int? page;
  final List<Movies>? results;
  final int? totalResults;
  final int? totalPages;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
