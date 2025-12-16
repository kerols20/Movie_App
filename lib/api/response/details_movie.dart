import 'package:json_annotation/json_annotation.dart';
import '../../domin/entity/get_details_entity.dart';
import '../models/movie_model.dart';
import '../models/torrents_model.dart';
part 'details_movie.g.dart';
@JsonSerializable()
class DetailsMovie {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final Data? data;
  DetailsMovie ({
    this.status,
    this.statusMessage,
    this.data,
  });

  factory DetailsMovie.fromJson(Map<String, dynamic> json) {
    return _$DetailsMovieFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DetailsMovieToJson(this);
  }
  DetailsMovieEntity toEntity() {
    return DetailsMovieEntity(
      status: status,
      statusMessage: statusMessage,
      data: data?.toEntity(),
    );
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "movie")
  final Movies? movie;
  @JsonKey(name: "torrent")
  final List<Torrents>? torrent;
  Data ({
    this.movie,
    this.torrent,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
  DataEntity toEntity() {
    return DataEntity(
      movie: movie?.toEntity(),
      torrents: torrent?.map((e) => e.toEntity()).toList(),
    );
  }
}

