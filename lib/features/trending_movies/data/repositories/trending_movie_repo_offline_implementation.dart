import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/core/errors/local_failure.dart';
import 'package:iq_movies_app/core/providers/local/hive_service.dart';
import 'package:iq_movies_app/core/providers/remote/api_service.dart';
import 'package:iq_movies_app/core/utils/constants/hive_storage_const.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';
import 'package:iq_movies_app/features/trending_movies/data/repositories/trending_movie_repository.dart';

class TrendingMovieRepoOffLineImplementation extends TrendingMovieRepository {
  final HiveService hiveService;

  TrendingMovieRepoOffLineImplementation({required this.hiveService});
  @override
  Future<(Failure?, List<Movie>?)> getTrendingMovies({int? page}) async {
    List<Movie>? movies = [];
    Failure? failure;
    bool isExist = await hiveService.isExists(boxName: kMovieKey);
    if (isExist) {
      movies = await hiveService.getBoxes<Movie>(kMovieKey);
      if (movies == null) {
        failure = const LoaclFailure("You have no cached Movies");
      }
    } else {
      failure = const LoaclFailure("You have no cached data");
    }
    return (failure, movies);
  }

  @override
  Future<Failure?> addMovieList({required List<Movie> movie}) async {
    try {
      ApiServices apiService = ApiServices();
      await Future.wait(movie.map((element) async {
        if (element.backdropPath != null) {
          element.posterOfflinePath =
              await apiService.downloadAndStoreImage(element.posterPath);
        }
      })).then((value) async {
        await hiveService.addBoxes(movie, kMovieKey);
      });
    } catch (ex) {
      return const LoaclFailure("Something went wrong");
    }
    return null;
  }

  @override
  Future<void> clearMovieList() async {
    try {
      List<Movie> movies = await hiveService.getBoxes<Movie>(kMovieKey);
      if (movies.isNotEmpty) {
        await Future.wait(movies.map((element) async {
          if (element.posterOfflinePath != null) {
            await File(element.posterOfflinePath!).delete();
          }
        }));
      }
      await hiveService.clear(kMovieKey);
      await hiveService.clear(kMovieDetailWord);
    } catch (e) {
      if (e is! PathNotFoundException) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Future<(Failure?, MovieDetail?)> getMovieDetail(
      {required int movieId}) async {
    {
      MovieDetail? movie;
      Failure? failure;
      bool isExist = await hiveService.isExists(boxName: kMovieDetailWord);

      if (isExist) {
        movie = await hiveService.getBox<MovieDetail>(
            movieId.toString(), kMovieDetailWord);
        if (movie == null) {
          failure = const LoaclFailure(
              "You don't have this movie in the local storage");
        }
      } else {
        failure = const LoaclFailure("You have no cached data");
      }
      return (failure, movie);
    }
  }

  @override
  Future<Failure?>? addMovie({required MovieDetail movie}) async {
    {
      try {
        ApiServices apiService = ApiServices();

        movie.backdropOfflinePath =
            await apiService.downloadAndStoreImage(movie.backdropPath);
        await hiveService.addBox(movie.id.toString(), movie, kMovieDetailWord);
      } catch (ex) {
        return const LoaclFailure("Something went wrong");
      }
      return null;
    }
  }

  @override
  Future<void> clearMovieDetail({required int movieId}) async {
    try {
      final movieDetail =
          await hiveService.getBox(movieId.toString(), kMovieDetailWord);
      if (movieDetail != null) {
        movieDetail.clear();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
