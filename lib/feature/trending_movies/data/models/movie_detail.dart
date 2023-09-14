// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'movie_detail.g.dart';

@HiveType(typeId: 5)
class MovieDetail extends Equatable {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String backdropPath;
  @HiveField(2)
  final int? budget;
  @HiveField(3)
  final List<Genre> genres;
  @HiveField(4)
  final String homepage;
  @HiveField(5)
  final int id;
  @HiveField(6)
  final String imdbId;
  @HiveField(7)
  final String originalLanguage;
  @HiveField(8)
  final String originalTitle;
  @HiveField(9)
  final String overview;
  @HiveField(10)
  final double popularity;
  @HiveField(11)
  final String posterPath;
  @HiveField(12)
  final List<ProductionCompany> productionCompanies;
  @HiveField(13)
  final List<ProductionCountry> productionCountries;
  @HiveField(14)
  final String releaseDate;
  @HiveField(15)
  final int? revenue;
  @HiveField(16)
  final int runtime;
  @HiveField(17)
  final List<SpokenLanguage> spokenLanguages;
  @HiveField(18)
  final String status;
  @HiveField(19)
  final String tagline;
  @HiveField(20)
  final String title;
  @HiveField(21)
  final bool video;
  @HiveField(22)
  final double voteAverage;
  @HiveField(23)
  final int voteCount;
  @HiveField(24)
  String? backdropOfflinePath;

  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  void setBackdropOfflinePath(String? path) {
    backdropOfflinePath = path;
  }

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      budget: json['budget'] as int?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      imdbId: json['imdb_id'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: json['popularity'] as double,
      posterPath: json['poster_path'] as String,
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: json['vote_average'] as double,
      voteCount: json['vote_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'budget': budget,
      'genres': genres.map((e) => e.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies.map((e) => e.toJson()).toList(),
      'production_countries':
          productionCountries.map((e) => e.toJson()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages.map((e) => e.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

@HiveType(typeId: 1)
class Genre extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}

@HiveType(typeId: 2)
class ProductionCompany extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? logoPath;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String originCountry;

  const ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}

@HiveType(typeId: 3)
class ProductionCountry extends Equatable {
  @HiveField(0)
  final String iso31661;
  @HiveField(1)
  final String name;

  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [iso31661, name];
}

@HiveType(typeId: 4)
class SpokenLanguage extends Equatable {
  @HiveField(0)
  final String englishName;
  @HiveField(1)
  final String iso6391;
  @HiveField(2)
  final String name;

  const SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String,
      iso6391: json['iso_639_1'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [englishName, iso6391, name];
}
