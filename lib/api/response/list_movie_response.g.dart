// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMovieResponse _$ListMovieResponseFromJson(Map<String, dynamic> json) =>
    ListMovieResponse(
      torrent: (json['torrent'] as List<dynamic>?)
          ?.map((e) => Torrents.fromJson(e as Map<String, dynamic>))
          .toList(),
      movie: (json['movie'] as List<dynamic>?)
          ?.map((e) => Movies.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListMovieResponseToJson(ListMovieResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
      'movie': instance.movie,
      'torrent': instance.torrent,
    };
