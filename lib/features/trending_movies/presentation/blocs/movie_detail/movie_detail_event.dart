part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent {
  const MovieDetailEvent();
}

class MovieDetailFetchDataEvent extends MovieDetailEvent {
  final int? movieId;
  const MovieDetailFetchDataEvent({
    required this.movieId,
  });
}

class MovieDetailFetchDataFromLocalEvent extends MovieDetailEvent {
  final int? movieId;
  const MovieDetailFetchDataFromLocalEvent({
    required this.movieId,
  });
}
