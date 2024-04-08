import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loaded({required List<String> data}) {
    emit(HomeLoaded(data: data));
  }

  void loading() {
    emit(HomeLoading());
  }
}
