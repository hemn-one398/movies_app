import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/core/errors/server_failure.dart';
import 'package:iq_movies_app/core/providers/remote/api_service.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/features/trending_movies/data/repositories/trending_movie_repository.dart';

class TrendingMovieRepoOnLineImplementation extends TrendingMovieRepository {
  final ApiServices apiService;

  TrendingMovieRepoOnLineImplementation({required this.apiService});
  @override
  Future<(Failure?, List<Movie>?)> getTrendingMovies({int? page}) async {
    List<Movie>? movies = [];
    Failure? failure;
    try {
      var data = await apiService.get(
          endPoint: ApiConsts.trendingMovieListEndPoint(page: page!));

      for (var item in data['results']) {
        try {
          final Movie movie = Movie.fromJson(item);
          movies.add(movie);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } catch (exception) {
      if (exception is DioException) {
        failure = ServerFailure.fromDioError(exception);
      } else {
        failure = ServerFailure(exception.toString());
      }
    }
    return (failure, movies);
  }

  @override
  Future<Failure?> addMovieList({required List<Movie> movie}) {
    throw UnimplementedError();
  }
}
