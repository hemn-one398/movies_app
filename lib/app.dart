import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_movies_app/core/providers/local/hive_service.dart';
import 'package:iq_movies_app/core/providers/remote/api_service.dart';
import 'package:iq_movies_app/features/trending_movies/data/repositories/trending_movie_repo_offline_implementation.dart';
import 'package:iq_movies_app/features/trending_movies/data/repositories/trending_movie_repo_online_implementation.dart';
import 'package:iq_movies_app/features/trending_movies/presentation/blocs/trending_bloc/trending_bloc.dart';
import 'package:iq_movies_app/features/trending_movies/presentation/view/screens/trending_screen.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, orientation, deviceType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<TrendingMovieBloc>(
              create: (context) => TrendingMovieBloc(
                  onlineRepo: TrendingMovieRepoOnLineImplementation(
                    apiService: ApiServices(),
                  ),
                  offlineRepo: TrendingMovieRepoOffLineImplementation(
                    hiveService: HiveService(),
                  )),
            )
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'IQ Movies',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const TrendingScreen()));
    });
  }
}
