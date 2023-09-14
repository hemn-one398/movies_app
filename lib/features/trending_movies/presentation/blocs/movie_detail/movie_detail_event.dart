part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent {
  const MovieDetailEvent();
}

class MovieDetailFetchDataEvent extends MovieDetailEvent {
  final Movie movie;
  const MovieDetailFetchDataEvent({
    required this.movie,
  });
}
