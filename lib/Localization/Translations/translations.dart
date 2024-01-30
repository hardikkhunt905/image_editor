import 'package:image_editor/Localization/Language/en_us.dart';
import 'package:image_editor/Localization/Language/gu_in.dart';

final List<LanguageModel> languages = [
  LanguageModel("English", "en"),
  LanguageModel("Gujarati", "gu"),
];

class LanguageModel {
  LanguageModel(
      this.language,
      this.symbol,
      );

  String language;
  String symbol;
}


abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": enUs,
    "gu": guIn,
  };
}