import 'package:json_annotation/json_annotation.dart';

import '../../domin/entity/list_movie_entity.dart';
import '../models/data_model.dart';
import '../models/movie_model.dart';
import '../models/torrents_model.dart';
part 'list_movie_response.g.dart';
@JsonSerializable()
class ListMovieResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final Data? data;
  @JsonKey(name: "movie")
  final List<Movies>? movie;
  @JsonKey(name: "torrent")
  final List<Torrents>? torrent;
  ListMovieResponse ({
    this.torrent,
    this.movie,
    this.status,
    this.statusMessage,
    this.data,
  });

  factory ListMovieResponse.fromJson(Map<String, dynamic> json) {
    return _$ListMovieResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListMovieResponseToJson(this);
  }
  ListMovieEntity toEntity(){
    return ListMovieEntity(
      statusMessage: statusMessage,
      movie: data?.movies?.map((e) => e.toEntity()).toList(),
      torrent: torrent?.map((e) => e.toEntity()).toList(),
      status: status,
      data: data?.toEntity(),
    );
  }
}




