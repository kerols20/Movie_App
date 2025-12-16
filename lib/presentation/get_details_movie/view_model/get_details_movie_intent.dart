sealed class GetDetailsMovieIntent{}
class InitializationGetDetailsMovieIntent extends GetDetailsMovieIntent{
  final int movieId;
  InitializationGetDetailsMovieIntent({required this.movieId});
}