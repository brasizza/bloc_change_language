import 'package:dio/dio.dart';
import 'package:language_change/core/language/cubit/language_controller.dart';
import 'package:language_change/core/language/cubit/language_cubit.dart';
import 'package:language_change/modules/home/cubit/home_cubit.dart';

class HomeController {
  final LanguageController language;
  final HomeCubit _cubit;

  HomeController({required this.language, required HomeCubit cubit}) : _cubit = cubit;

  init() async {
    _cubit.loaded(data: await load(language: language.language ?? 'Brazil'));
    language.listen().listen((event) async {
      if (event is LanguageChanged) {
        _cubit.loading();
        _cubit.loaded(data: await load(language: event.language));
      }
    });
  }

  Future<List<String>> load({required String language}) async {
    List<String> data = [];
    final rest = Dio();
    final url = "http://universities.hipolabs.com/search?country=$language";
    final response = await rest.get(url);
    data.clear();
    for (var list in (response.data as List)) {
      data.add(list['name']);
    }

    return data;
  }
}
