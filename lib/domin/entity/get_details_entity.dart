import 'movie_entity.dart';
import 'torrent_entity.dart';
class DetailsMovieEntity {
  final String? status;
  final String? statusMessage;
  final DataEntity? data;

  DetailsMovieEntity({
    this.status,
    this.statusMessage,
    this.data,
  });
}

class DataEntity {
  final MovieEntity? movie;
  final List<TorrentsEntity>? torrents;

  DataEntity({
    this.movie,
    this.torrents,
  });
}
