import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_movies_app/core/utils/widgets/custom_circular_loading.dart';
import 'package:iq_movies_app/core/utils/widgets/movie_item_card.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';
import 'package:iq_movies_app/feature/trending_movies/presentation/blocs/trending_bloc/trending_bloc.dart';

class TrendingMovieListBody extends StatefulWidget {
  const TrendingMovieListBody({Key? key}) : super(key: key);

  @override
  State<TrendingMovieListBody> createState() => _TrendingMovieListBodyState();
}

class _TrendingMovieListBodyState extends State<TrendingMovieListBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingMovieBloc, TrendingMovieState>(
      buildWhen: (previous, current) => current is! TrendingMoviesListenable,
      listener: _listner,
      builder: _builder,
    );
  }

  void _listner(BuildContext context, TrendingMovieState state) {}

  Widget _builder(BuildContext context, TrendingMovieState state) {
    if (state is TrendingMovieInitial) {
      return const CustomCircularProgressIndicator();
    } else {
      final currentState = state;
      final List<Movie> movies = [];
      if (currentState is TrendingMoviesLoaded) {
        movies.addAll(currentState.movies);
      }
      return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieItemCard(
              movie: movie,
              isOfflineState:
                  currentState is TrendingMoviesGetCachedDataFromLocalState,
            );
          });
    }
  }
}
