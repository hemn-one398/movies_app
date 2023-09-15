import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_movies_app/core/utils/widgets/custom_circular_loading.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';
import 'package:iq_movies_app/features/trending_movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:iq_movies_app/features/trending_movies/presentation/view/widgets/movie_detail_body.dart';

class TrendingMovieDetailScreen extends StatelessWidget {
  const TrendingMovieDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: _listener,
        builder: _builder,
      ),
    );
  }

  void _listener(BuildContext context, MovieDetailState state) {
    if (state is MovieDetailFailedState) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(title: Text(state.failure.errMessage), actions: [
            TextButton(
                child: const Text('Retry'),
                onPressed: () {
                  Navigator.pop(context);

                  BlocProvider.of<MovieDetailBloc>(context).add(
                    MovieDetailFetchDataEvent(
                      movieId: state.movieId,
                    ),
                  );
                }),
            TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ]);
        },
      );
    }
  }

  Widget _builder(BuildContext context, MovieDetailState state) {
    if (state is MovieDetailFetchDataState) {
      return const CustomCircularProgressIndicator();
    } else if (state is MovieDetailSuccessState) {
      final MovieDetail movieDetail = state.movie;
      return MovieDetailBody(
        movieDetail: movieDetail,
        isOfflineState: state is MovieDetailSuccessStateFromLocal,
      );
    } else if (state is MovieDetailFailedState) {
      return Center(
        child: Text(state.failure.errMessage),
      );
    }
    return const Center(
      child: Text('Something went wrong'),
    );
  }
}
