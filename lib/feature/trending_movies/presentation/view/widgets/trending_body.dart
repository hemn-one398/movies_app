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
  final ScrollController scrollController = ScrollController();
  late TrendingMovieBloc _trendingMovieBloc;

  @override
  void initState() {
    super.initState();
    _trendingMovieBloc = BlocProvider.of<TrendingMovieBloc>(context);
    _setUpScrollListner();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  _setUpScrollListner() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _trendingMovieBloc.add(TrendingMoviesLoadingMoreEvent());
      }
    });
  }

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
      bool isPaginationable = true;
      bool isLoadingMore = false;
      if (currentState is TrendingMoviesLoaded) {
        movies.addAll(currentState.movies);
      } else if (currentState is TrendingMoviesLoadingMoreDataState) {
        movies.addAll(currentState.loadedMovies);
        isLoadingMore = true;
      }
      if (movies.isEmpty) {
        return const Center(
          child: Text('No Movies'),
        );
      }
      debugPrint("movies.length : ${movies.length}");
      return ListView.builder(
          controller: isPaginationable ? scrollController : null,
          itemCount: movies.length + (isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < movies.length) {
              final movie = movies[index];
              return MovieItemCard(
                onTap: () {},
                movie: movie,
                isOfflineState:
                    currentState is TrendingMoviesGetCachedDataFromLocalState,
              );
            } else {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
              return const CustomCircularProgressIndicator();
            }
          });
    }
  }
}
