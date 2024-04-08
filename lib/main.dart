import 'package:flutter/material.dart';
import 'package:language_change/core/language/cubit/language_controller.dart';
import 'package:language_change/core/language/cubit/language_cubit.dart';
import 'package:language_change/modules/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiProvider(
          providers: [
            Provider(
              create: (context) => LanguageCubit(),
            ),
            Provider(
              create: (context) => LanguageController(cubit: context.read())..init(lang: 'Brazil'),
            ),
          ],
          builder: (context, child) => const HomePage(),
        ));
  }
}
