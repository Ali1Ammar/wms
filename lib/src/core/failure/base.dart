import 'package:wms/localization/localization.dart';

sealed class BaseFailure {
  BaseFailure();

  String translate(AppLocalizations localizations);
}

sealed class LogicFailure implements BaseFailure {
  LogicFailure();

  @override
  translate(AppLocalizations localizations);
}

class UnknownFailure implements BaseFailure {
  final Object error;
  UnknownFailure(this.error);

  @override
  translate(AppLocalizations localizations) {
    return localizations.unknownError;
  }
}
