import 'package:equatable/equatable.dart';
import 'package:movie_app/domin/entity/torrent_entity.dart';
import 'data_entity.dart';
import 'movie_entity.dart';
class ListMovieEntity extends Equatable{
 final String? status;
 final String? statusMessage;
 final DataEntity? data;
 final List<MovieEntity>? movie;
 final List<TorrentsEntity>? torrent;
 const ListMovieEntity({
   this.torrent,
   this.movie,
   this.status,
   this.statusMessage,
   this.data,
 });
 @override
  List<Object?> get props => [
   status,
   statusMessage,
   data,
   movie,
   torrent,
 ];


}