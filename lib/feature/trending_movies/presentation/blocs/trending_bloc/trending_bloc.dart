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

  TrendingMovieBloc({
    required this.onlineRepo,
  }) : super(TrendingMovieInitial()) {
    on<TrendingMoviesFirstFetch>(_firstFetchingOfData);
  }
  int page = 1;
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
}
