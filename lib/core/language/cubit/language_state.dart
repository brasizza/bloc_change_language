part of 'language_cubit.dart';

sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class LanguageChanged extends LanguageState {
  final String language;

  LanguageChanged({required this.language});
}
