import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_bloc_event.dart';
part 'trending_bloc_state.dart';

class TrendingBlocBloc extends Bloc<TrendingBlocEvent, TrendingBlocState> {
  TrendingBlocBloc() : super(TrendingBlocInitial()) {
    on<TrendingBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
