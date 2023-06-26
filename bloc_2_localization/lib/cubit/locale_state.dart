part of 'locale_cubit.dart';

@immutable
abstract class LocaleState {}

class LocaleInitial extends LocaleState {}

class ChangeLocalState extends LocaleState {
  final Locale locale;

  ChangeLocalState({
    required this.locale,
  });
}
