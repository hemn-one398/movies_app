import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:iq_movies_app/core/errors/failures.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  TrendingMovieBloc() : super(TrendingMovieInitial());
}
