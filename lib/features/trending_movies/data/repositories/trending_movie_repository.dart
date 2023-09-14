import 'package:flutter/foundation.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';

@immutable
abstract class TrendingMovieRepository {
  Future<(Failure?, List<Movie>?)> getTrendingMovies({int? page});

// return a null so Dart doesn't force me to override it
  Future<Failure?>? addMovieList({
    required List<Movie> movie,
  }) {
    return null;
  }

  Future<(Failure?, MovieDetail?)> getMovieDetail({
    required int movieId,
  });

// return a null so Dart doesn't force me to override it
  Future<void>? clearMovieList() {
    return null;
  }

  Future<Failure?>? addMovie({
    required MovieDetail movie,
  }) {
    return null;
  }

  Future<void>? clearMovieDetail({
    required int movieId,
  }) {
    return null;
  }
}
