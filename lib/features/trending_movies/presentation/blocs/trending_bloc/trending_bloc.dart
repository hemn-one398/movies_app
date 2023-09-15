import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/features/trending_movies/data/repositories/trending_movie_repository.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  TrendingMovieRepository onlineRepo;
  TrendingMovieRepository offlineRepo;

  int page = 1;
  TrendingMovieBloc({
    required this.onlineRepo,
    required this.offlineRepo,
  }) : super(TrendingMovieInitial()) {
    on<TrendingMoviesFirstFetch>(_firstFetchingOfData);
    on<TrendingMoviesLoadingMoreEvent>(_fetchingMoreData);
    on<TrendingMoviesSearchEvent>(_searchForMovieEvent);
    on<TrendingMoviesFetchCachedDataFromLocalEvent>(_fetchCachedDataFromLocal);
  }

  FutureOr<void> _firstFetchingOfData(event, emit) async {
    var (faliure, movies) = await onlineRepo.getTrendingMovies(page: page);
    if (faliure == null) {
      page++;

      emit(TrendingMoviesLoaded(movies: movies!));

      await offlineRepo.clearMovieList();
      await offlineRepo.addMovieList(movie: movies);
    } else {
      final bool isFirstFetch = page == 1;
      emit(
        TrendingMoviesFailedState(
            failure: faliure, isFirstFetchFailure: isFirstFetch),
      );
    }
  }

  FutureOr<void> _fetchingMoreData(event, emit) async {
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
      page++;
      loadedMoves.addAll(newFetchedmovies!);
      emit(TrendingMoviesLoaded(movies: loadedMoves));
      offlineRepo.addMovieList(movie: newFetchedmovies);
    } else {
      emit(TrendingMoviesFailedState(
        failure: faliure,
      ));
      // to show old loaded data
      emit(TrendingMoviesLoaded(movies: loadedMoves));
    }
  }

  List<Movie> unFilteredList = [];
  FutureOr<void> _searchForMovieEvent(event, emit) {
    final query = event.query;

    if (state is TrendingMoviesLoaded) {
      unFilteredList = (state as TrendingMoviesLoaded).movies;
    }
    if (query.isEmpty) {
      emit(TrendingMoviesLoaded(
        movies: unFilteredList,
      ));
    } else {
      final filteredList = unFilteredList.where((element) {
        return element.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(TrendingMoviesFilteringState(filteredMovies: filteredList));
    }
  }

  FutureOr<void> _fetchCachedDataFromLocal(
      TrendingMoviesFetchCachedDataFromLocalEvent event,
      Emitter<TrendingMovieState> emit) async {
    var (faliure, movies) = await offlineRepo.getTrendingMovies();
    if (faliure == null) {
      emit(TrendingMoviesGetCachedDataFromLocalState(
        movies: movies!,
      ));
    } else {
      emit(TrendingMoviesFailedState(
        failure: faliure,
      ));
    }
  }
}
