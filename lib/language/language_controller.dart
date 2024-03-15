import 'package:get/get.dart';

import 'en.dart';

class LanguagesTranslations extends Translations {
  // Initial translations
  static Map<String, Map<String, String>> translationsMap = {
    'EN': yourEnglishTranslations,
    'fr_FR': yourFrenchTranslations,
    // 'fr_FR': yourFrenchTranslations,
    // Add more languages as needed
  };

  @override
  Map<String, Map<String, String>> get keys => translationsMap;
}
