import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_movies_app/feature/trending_movies/presentation/blocs/trending_bloc/trending_bloc.dart';
import 'package:iq_movies_app/feature/trending_movies/presentation/view/screens/trending_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TrendingBloc>(
            create: (context) => TrendingBloc(),
          )
        ],
        child: MaterialApp(
            title: 'IQ Movies',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const TrendingScreen()));
  }
}
