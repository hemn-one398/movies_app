import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/core/errors/local_failure.dart';
import 'package:iq_movies_app/core/providers/local/hive_service.dart';
import 'package:iq_movies_app/core/providers/remote/api_service.dart';
import 'package:iq_movies_app/core/utils/constants/hive_storage_const.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/feature/trending_movies/data/repositories/trending_movie_repository.dart';

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
          element.backdropOfflinePath =
              await apiService.downloadAndStoreImage(element.backdropPath);
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
          if (element.backdropOfflinePath != null) {
            await File(element.backdropOfflinePath!).delete();
         
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
}
