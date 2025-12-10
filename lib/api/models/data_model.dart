
import 'package:json_annotation/json_annotation.dart';

import '../../domin/entity/data_entity.dart';
import 'movie_model.dart';
part 'data_model.g.dart';
@JsonSerializable()
class Data {
  @JsonKey(name: "movie_count")
  final int? movieCount;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "page_number")
  final int? pageNumber;
  @JsonKey(name: "movies")
  final List<Movies>? movies;

  Data ({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
  DataEntity toEntity(){
    return DataEntity(
      movieCount: movieCount,
      limit: limit,
      pageNumber: pageNumber,
      movies: movies?.map((e) => e.toEntity()).toList(),
      );
}
}