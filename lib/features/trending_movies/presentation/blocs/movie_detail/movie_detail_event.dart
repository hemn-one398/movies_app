part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent {
  const MovieDetailEvent();
}

class MovieDetailFetchDataEvent extends MovieDetailEvent {
  final int movieId;
  //I want access to this offline path so I dont have to download  and store it again
  final String? backdropOfflinePath;

  const MovieDetailFetchDataEvent({
    required this.movieId,
    required this.backdropOfflinePath,
  });
}
