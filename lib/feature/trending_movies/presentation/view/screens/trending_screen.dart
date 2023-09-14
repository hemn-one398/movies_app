import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_movies_app/feature/trending_movies/presentation/blocs/trending_bloc/trending_bloc.dart';
import 'package:iq_movies_app/feature/trending_movies/presentation/view/widgets/trending_body.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  Timer? _debounce;
  late TrendingMovieBloc _trendingMovieBloc;

  @override
  void initState() {
    super.initState();
    _trendingMovieBloc = BlocProvider.of<TrendingMovieBloc>(context);
    _trendingMovieBloc.add(TrendingMoviesFirstFetch());
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _trendingMovieBloc.add(
        TrendingMoviesSearchEvent(
          query: query,
        ),
      );
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movie'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  hintText: 'Search by Movie Title',
                )),
          ),
          const Expanded(child: TrendingMovieListBody()),
        ],
      ),
    );
  }
}
