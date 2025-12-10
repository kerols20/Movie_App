import 'package:equatable/equatable.dart';
import 'package:movie_app/domin/entity/torrent_entity.dart';
class MovieEntity extends Equatable {
  final int? id;
  final String? url;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final String? slug;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? state;
  final List<TorrentsEntity>? torrents;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  const MovieEntity({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  @override
  List<Object?> get props => [
    id,
    url,
    imdbCode,
    title,
    titleEnglish,
    titleLong,
    slug,
    year,
    rating,
    runtime,
    genres,
    summary,
    descriptionFull,
    synopsis,
    ytTrailerCode,
    language,
    mpaRating,
    backgroundImage,
    backgroundImageOriginal,
    smallCoverImage,
    mediumCoverImage,
    largeCoverImage,
    state,
    torrents,
    dateUploaded,
    dateUploadedUnix,
  ];
}
