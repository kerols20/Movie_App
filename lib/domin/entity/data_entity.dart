import 'package:equatable/equatable.dart';

import 'movie_entity.dart';
class DataEntity extends Equatable {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<MovieEntity>? movies;

  const DataEntity({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
  });

  @override
  List<Object?> get props => [movieCount, limit, pageNumber, movies];
}
