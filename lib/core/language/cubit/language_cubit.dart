import 'package:bloc/bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void changeLanguage({required String lang}) {
    emit(LanguageChanged(language: lang));
  }
}
