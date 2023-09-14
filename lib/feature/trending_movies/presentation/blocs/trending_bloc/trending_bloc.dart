import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/feature/trending_movies/data/repositories/trending_movie_repository.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  TrendingMovieRepository onlineRepo;
  int page = 1;
  TrendingMovieBloc({
    required this.onlineRepo,
  }) : super(TrendingMovieInitial()) {
    on<TrendingMoviesFirstFetch>(_firstFetchingOfData);
    on<TrendingMoviesLoadingMoreEvent>(_fetchingMoreData);
  }

  FutureOr<void> _firstFetchingOfData(event, emit) async {
    var (faliure, movies) = await onlineRepo.getTrendingMovies(page: page);
    if (faliure == null) {
      page++;
      emit(TrendingMoviesLoaded(movies: movies!));
    } else {
      final bool isFirstFetch = page == 1;
      emit(
        TrendingMoviesFailedState(
            failure: faliure, isFirstFetchFailure: isFirstFetch),
      );
    }
  }

  FutureOr<void> _fetchingMoreData(TrendingMoviesLoadingMoreEvent event,
      Emitter<TrendingMovieState> emit) async {
    final currentState = state;
    // loadedMovies is for holding loaded movies and append it upcoming movies from scrolling

    List<Movie> loadedMoves = [];
    if (currentState is TrendingMoviesLoaded) {
      loadedMoves = currentState.movies;
    }
    // I dont want lose the loaded movies cuz changing of the state
    emit(TrendingMoviesLoadingMoreDataState(
      loadedMovies: loadedMoves,
    ));

    var (faliure, newFetchedmovies) =
        await onlineRepo.getTrendingMovies(page: page);
    if (faliure == null) {
      loadedMoves.addAll(newFetchedmovies!);
      emit(TrendingMoviesLoaded(movies: loadedMoves));
    } else {
      emit(TrendingMoviesFailedState(
        failure: faliure,
      ));
    }
  }
}
