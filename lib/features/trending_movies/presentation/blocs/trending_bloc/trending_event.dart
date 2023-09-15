part of 'trending_bloc.dart';

sealed class TrendingMovieEvent {
  const TrendingMovieEvent();
}

class TrendingMoviesLoadingMoreEvent extends TrendingMovieEvent {}

class TrendingMoviesFirstFetch extends TrendingMovieEvent {}

class TrendingMoviesFetchCachedDataFromLocalEvent extends TrendingMovieEvent {}

class TrendingMoviesSearchEvent extends TrendingMovieEvent {
  final String query;

  const TrendingMoviesSearchEvent({required this.query});
}


