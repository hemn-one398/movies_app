import 'package:flutter/foundation.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';

@immutable
abstract class TrendingMovieRepository {
  Future<(Failure?, List<Movie>?)> getTrendingMovies({int? page});
}
