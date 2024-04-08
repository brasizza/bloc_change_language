import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_change/core/language/cubit/language_controller.dart';
import 'package:language_change/modules/home/cubit/home_cubit.dart';
import 'package:language_change/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HomeCubit(),
        ),
        Provider(
          lazy: false,
          create: (context) => HomeController(language: context.read(), cubit: context.read())..init(),
        )
      ],
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<LanguageController>().changeLanguage(lang: 'Brazil');
                        },
                        child: const Text('Brazil')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<LanguageController>().changeLanguage(lang: 'Spain');
                        },
                        child: const Text('Spain')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<LanguageController>().changeLanguage(lang: 'United States');
                        },
                        child: const Text('United States')),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Chamando dados da api ${context.read<LanguageController>().language}"),
                      Expanded(
                        child: ListView.builder(
                          itemCount: (state as HomeLoaded).data.length,
                          itemBuilder: (context, index) {
                            final text = (state).data[index];

                            return Text(text);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
