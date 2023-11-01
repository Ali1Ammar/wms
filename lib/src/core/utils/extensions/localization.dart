import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension Translation on BuildContext {
  AppLocalizations get translator => AppLocalizations.of(this)!;
  List<Locale> get supportedLang => AppLocalizations.supportedLocales;
}

extension TranslationOnRef on Ref {
  AppLocalizations get translator => read(translatorProvider);
}

// https://codewithandrea.com/articles/app-localizations-outside-widgets-riverpod/
final translatorProvider = Provider<AppLocalizations>((ref) {
  const local = Locale("ar"); ////ui.window.locale
  return lookupAppLocalizations(local);
});
