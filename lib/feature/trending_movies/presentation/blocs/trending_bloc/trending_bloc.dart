import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_bloc_event.dart';
part 'trending_bloc_state.dart';

class TrendingBloc extends Bloc<TrendingBlocEvent, TrendingBlocState> {
  TrendingBloc() : super(TrendingBlocInitial());
}
