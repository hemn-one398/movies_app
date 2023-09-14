part of 'movie_detail_bloc.dart';

sealed class MovieDetailState {
  const MovieDetailState();
}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailFetchDataState extends MovieDetailState {}

final class MovieDetailFailedState extends MovieDetailState {
  final Failure failure;
  const MovieDetailFailedState(this.failure);
}

class MovieDetailSuccessState extends MovieDetailState {
  final MovieDetail movie;
  const MovieDetailSuccessState(this.movie);
}

final class MovieDetailSuccessStateFromAPI extends MovieDetailSuccessState {
  const MovieDetailSuccessStateFromAPI(super.movie);
}

final class MovieDetailSuccessStateFromLocal extends MovieDetailSuccessState {
  const MovieDetailSuccessStateFromLocal(super.movie);
}
