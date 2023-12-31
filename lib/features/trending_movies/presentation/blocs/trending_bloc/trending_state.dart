part of 'trending_bloc.dart';

@immutable
sealed class TrendingMovieState {
  const TrendingMovieState();
}

// this class, is use it just for states that need to be only listened
sealed class TrendingMoviesListenable extends TrendingMovieState {}

final class TrendingMovieInitial extends TrendingMovieState {}

final class TrendingMoviesLoadingMoreDataState extends TrendingMovieState {
  final List<Movie> loadedMovies;

  const TrendingMoviesLoadingMoreDataState({
    required this.loadedMovies,
  });
}

// loaded state means success state
final class TrendingMoviesLoaded extends TrendingMovieState {
  final List<Movie> movies;

  const TrendingMoviesLoaded({
    required this.movies,
  });
}

final class TrendingMoviesGetCachedDataFromLocalState
    extends TrendingMoviesLoaded {
  const TrendingMoviesGetCachedDataFromLocalState({required super.movies});
}



final class TrendingMoviesFilteringState extends TrendingMovieState {
  final List<Movie> filteredMovies;

  const TrendingMoviesFilteringState({
    required this.filteredMovies,
  });
}

final class TrendingMoviesFailedState extends TrendingMoviesListenable {
  final Failure failure;
  final bool isFirstFetchFailure;

  TrendingMoviesFailedState({
    required this.failure,
    this.isFirstFetchFailure = false,
  });
}
