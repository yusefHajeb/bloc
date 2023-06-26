import 'package:bloc/bloc.dart';
import 'package:bloc_2_localization/language_cashed.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(
      ChangeLocalState(
        locale: Locale(
          cachedLanguageCode,
        ),
      ),
    );
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cachedLanguageCode(languageCode);

    emit(
      ChangeLocalState(
        locale: Locale(
          languageCode,
        ),
      ),
    );
  }
}
