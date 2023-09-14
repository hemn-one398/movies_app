part of 'trending_bloc.dart';

sealed class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();

  @override
  List<Object> get props => [];
}

class TrendingMoviesLoadingMoreEvent extends TrendingMovieEvent {}

class TrendingMoviesFirstFetch extends TrendingMovieEvent {}

class TrendingMoviesFetchCachedDataFromLocalEvent extends TrendingMovieEvent {}

class TreandingMoviesRefresh extends TrendingMovieEvent {}


class TrendingMoviesNavigateToMovieDetailPageEvent
    extends TrendingMovieEvent {
  final Movie movie;

  const TrendingMoviesNavigateToMovieDetailPageEvent(this.movie);
}
