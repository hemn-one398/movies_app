import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_movies_app/features/trending_movies/presentation/blocs/trending_bloc/trending_bloc.dart';
import 'package:iq_movies_app/features/trending_movies/presentation/view/widgets/trending_body.dart';

import 'dart:developer' as developer;

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  Timer? _debounce;
  late TrendingMovieBloc _trendingMovieBloc;
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult result = ConnectivityResult.none;
  @override
  void initState() {
    initConnectivity();

    _trendingMovieBloc = BlocProvider.of<TrendingMovieBloc>(context);

    super.initState();
  }

  Future<void> initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _trendingMovieBloc.add(result == ConnectivityResult.none
          ? TrendingMoviesFetchCachedDataFromLocalEvent()
          : TrendingMoviesFirstFetch());
    });
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
