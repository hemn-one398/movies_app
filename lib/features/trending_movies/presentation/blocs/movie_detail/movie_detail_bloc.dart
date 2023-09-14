import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';
import 'package:iq_movies_app/features/trending_movies/data/repositories/trending_movie_repository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  TrendingMovieRepository onlineRepo;
  TrendingMovieRepository offlineRepo;

  MovieDetailBloc({
    required this.onlineRepo,
    required this.offlineRepo,
  }) : super(MovieDetailInitial()) {
    on<MovieDetailFetchDataEvent>(_fetchMovieData);
  }

  FutureOr<void> _fetchMovieData(
      MovieDetailFetchDataEvent event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailFetchDataState());
    Future.delayed(const Duration(seconds: 1));
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      await _fetchMovieDataFromLocal(event, emit);
    } else {
      await _fetchMovieDataFromAPI(event, emit);
    }
  }

  _fetchMovieDataFromAPI(event, emit) async {
    var (failure, movieDetail) =
        await onlineRepo.getMovieDetail(movieId: event.movie.id!);

    if (failure == null) {
      movieDetail!.backdropOfflinePath = event.movie.backdropOfflinePath;
      await offlineRepo.clearMovieDetail(movieId: event.movie.id!);
      await offlineRepo.addMovie(movie: movieDetail);
      emit(MovieDetailSuccessStateFromAPI(movieDetail));
    } else {
      emit(MovieDetailFailedState(failure));
    }
  }

  _fetchMovieDataFromLocal(event, emit) async {
    var (failure, movie) =
        await offlineRepo.getMovieDetail(movieId: event.movie.id!);

    if (failure == null) {
      emit(MovieDetailSuccessStateFromLocal(movie!));
    } else {
      emit(MovieDetailFailedState(failure));
    }
  }
}
