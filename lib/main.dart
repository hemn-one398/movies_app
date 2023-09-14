import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iq_movies_app/app.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  _registerHiveClassAdapters();
  runApp(const MyApp());
}

void _registerHiveClassAdapters() {
  Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(MovieDetailAdapter());
  Hive.registerAdapter(GenreAdapter());
  Hive.registerAdapter(ProductionCompanyAdapter());
  Hive.registerAdapter(ProductionCountryAdapter());
  Hive.registerAdapter(SpokenLanguageAdapter());
}
