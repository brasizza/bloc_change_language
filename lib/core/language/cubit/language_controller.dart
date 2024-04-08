import 'package:language_change/core/language/cubit/language_cubit.dart';

class LanguageController {
  final LanguageCubit _cubit;
  String? language;

  LanguageController({required LanguageCubit cubit}) : _cubit = cubit;

  void init({required String lang}) {
    changeLanguage(lang: lang);
  }

  Stream<LanguageState> listen() => _cubit.stream.asBroadcastStream();

  void changeLanguage({required String lang}) {
    language = lang;
    _cubit.changeLanguage(lang: lang);
  }
}
