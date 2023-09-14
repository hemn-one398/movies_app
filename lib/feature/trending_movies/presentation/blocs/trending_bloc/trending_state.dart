part of 'trending_bloc.dart';

@immutable
sealed class TrendingMovieState extends Equatable {
  const TrendingMovieState();

  @override
  List<Object> get props => [];
}

// this class, is use it just for states that need to be only listened
sealed class TrendingMoviesListenable extends TrendingMovieState {}

final class TrendingMovieInitial extends TrendingMovieState {}

final class TrendingMoviesLoadingNextPage extends TrendingMovieState {
  final List<Movie> loadedMovies;

  const TrendingMoviesLoadingNextPage({
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

//state of navigating to movie detail page
final class TrendingMoviesNavigateToMovieDetailPageState
    extends TrendingMoviesListenable {
  final Movie movie;

  TrendingMoviesNavigateToMovieDetailPageState(this.movie);
}

final class TrendingMoviesFilteringState extends TrendingMovieState {
  final List<Movie> filteredMovies;

  const TrendingMoviesFilteringState({
    required this.filteredMovies,
  });
}

final class TrendingMoviesFailedState extends TrendingMovieState {
  final Failure failure;
  final bool isFirstFetchFailure;

  const TrendingMoviesFailedState({
    required this.failure,
    required this.isFirstFetchFailure,
  });
}
