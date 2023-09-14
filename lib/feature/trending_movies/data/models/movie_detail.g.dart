// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailAdapter extends TypeAdapter<MovieDetail> {
  @override
  final int typeId = 5;

  @override
  MovieDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetail(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String,
      budget: fields[2] as int?,
      genres: (fields[3] as List).cast<Genre>(),
      homepage: fields[4] as String,
      id: fields[5] as int,
      imdbId: fields[6] as String,
      originalLanguage: fields[7] as String,
      originalTitle: fields[8] as String,
      overview: fields[9] as String,
      popularity: fields[10] as double,
      posterPath: fields[11] as String,
      productionCompanies: (fields[12] as List).cast<ProductionCompany>(),
      productionCountries: (fields[13] as List).cast<ProductionCountry>(),
      releaseDate: fields[14] as String,
      revenue: fields[15] as int?,
      runtime: fields[16] as int,
      spokenLanguages: (fields[17] as List).cast<SpokenLanguage>(),
      status: fields[18] as String,
      tagline: fields[19] as String,
      title: fields[20] as String,
      video: fields[21] as bool,
      voteAverage: fields[22] as double,
      voteCount: fields[23] as int,
    )..backdropOfflinePath = fields[24] as String?;
  }

  @override
  void write(BinaryWriter writer, MovieDetail obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.homepage)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.imdbId)
      ..writeByte(7)
      ..write(obj.originalLanguage)
      ..writeByte(8)
      ..write(obj.originalTitle)
      ..writeByte(9)
      ..write(obj.overview)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.posterPath)
      ..writeByte(12)
      ..write(obj.productionCompanies)
      ..writeByte(13)
      ..write(obj.productionCountries)
      ..writeByte(14)
      ..write(obj.releaseDate)
      ..writeByte(15)
      ..write(obj.revenue)
      ..writeByte(16)
      ..write(obj.runtime)
      ..writeByte(17)
      ..write(obj.spokenLanguages)
      ..writeByte(18)
      ..write(obj.status)
      ..writeByte(19)
      ..write(obj.tagline)
      ..writeByte(20)
      ..write(obj.title)
      ..writeByte(21)
      ..write(obj.video)
      ..writeByte(22)
      ..write(obj.voteAverage)
      ..writeByte(23)
      ..write(obj.voteCount)
      ..writeByte(24)
      ..write(obj.backdropOfflinePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 1;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCompanyAdapter extends TypeAdapter<ProductionCompany> {
  @override
  final int typeId = 2;

  @override
  ProductionCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompany(
      id: fields[0] as int,
      logoPath: fields[1] as String?,
      name: fields[2] as String,
      originCountry: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompany obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCountryAdapter extends TypeAdapter<ProductionCountry> {
  @override
  final int typeId = 3;

  @override
  ProductionCountry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountry(
      iso31661: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31661)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpokenLanguageAdapter extends TypeAdapter<SpokenLanguage> {
  @override
  final int typeId = 4;

  @override
  SpokenLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguage(
      englishName: fields[0] as String,
      iso6391: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
