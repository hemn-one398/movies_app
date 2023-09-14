import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/core/errors/local_failure.dart';
import 'package:iq_movies_app/core/providers/local/hive_service.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/feature/trending_movies/data/repositories/trending_movie_repository.dart';

class TrendingMovieRepoOffLineImplementation extends TrendingMovieRepository {
  final HiveService hiveService;

  TrendingMovieRepoOffLineImplementation({required this.hiveService});
  @override
  Future<(Failure?, List<Movie>?)> getTrendingMovies({int? page}) async {
    List<Movie>? movies = [];
    Failure? failure;
    bool isExist = await hiveService.isExists(boxName: 'movies');
    if (isExist) {
      movies = await hiveService.getBoxes<Movie>('movies');
      if (movies == null) {
        failure = const LoaclFailure("You have no cached Movies");
      }
    } else {
      failure = const LoaclFailure("You have no cached data");
    }
    return (failure, movies);
  }
}
