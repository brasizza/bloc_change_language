// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> data;

  HomeLoaded({required this.data});

  HomeLoaded copyWith({
    List<String>? data,
  }) {
    return HomeLoaded(
      data: data ?? this.data,
    );
  }
}
