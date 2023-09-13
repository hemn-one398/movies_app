part of 'trending_bloc_bloc.dart';

sealed class TrendingBlocState extends Equatable {
  const TrendingBlocState();
  
  @override
  List<Object> get props => [];
}

final class TrendingBlocInitial extends TrendingBlocState {}
