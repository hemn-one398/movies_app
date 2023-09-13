import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iq_movies_app/app.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  runApp(const MyApp());
}
