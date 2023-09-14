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
      appBar: AppBar(),
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: _listener,
        builder: _builder,
      ),
    );
  }

  void _listener(BuildContext context, MovieDetailState state) {}

  Widget _builder(BuildContext context, MovieDetailState state) {
    if (state is MovieDetailFetchDataState) {
      return const CustomCircularProgressIndicator();
    } else if (state is MovieDetailSuccessState) {
      final MovieDetail movieDetail = state.movie;
      return MovieDetailBody(movieDetail: movieDetail);
    } else {
      return const SizedBox();
    }
  }
}
