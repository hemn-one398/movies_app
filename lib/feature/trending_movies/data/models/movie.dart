// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'movie.g.dart'; // Generate a Hive TypeAdapter using the build_runner

@HiveType(typeId: 0) // Specify a unique typeId for this class
class Movie extends Equatable {
  @HiveField(0)
  final bool? adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  final List<int>? genreIds;
  @HiveField(3)
  final int? id;
  @HiveField(4)
  final String? originalLanguage;
  @HiveField(5)
  final String? originalTitle;
  @HiveField(6)
  final String? overview;
  @HiveField(7)
  final double? popularity;
  @HiveField(8)
  final String? posterPath;
  @HiveField(9)
  final String? releaseDate;
  @HiveField(10)
  final String? title;
  @HiveField(11)
  final bool? video;
  @HiveField(12)
  final double? voteAverage;
  @HiveField(13)
  final int? voteCount;
  @HiveField(14)
  String? backdropOfflinePath;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.backdropOfflinePath,
  });

  void setBackdropOfflinePath(String? path) {
    backdropOfflinePath = path;
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        backdropOfflinePath
      ];

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List?)?.cast<int>(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as double?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: double.parse(json['vote_average'].toString()),
      voteCount: json['vote_count'] as int?,
    );
  }
}
