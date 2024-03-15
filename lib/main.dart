import 'package:applocale/language/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language/language_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      translations: LanguagesTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('EN'),
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.red,
        colorSchemeSeed: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        // primaryColor: Colors.black,
        // Or another color
      ),
      home:

          // AdminSplashPage(),

          MyHomePage(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> supportedLanguages = ['en', 'fr'];

  @override
  Widget build(BuildContext context) {
    var localizedStrings = LanguagesTranslations().keys;
    var currentLocale = Get.locale;
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageConstants.home.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(localizedStrings['welcome_message']!),
            DropdownButton<String>(
              value: currentLocale!.languageCode,
              onChanged: (String? newLanguage) {
                if (newLanguage != null) {
                  Get.updateLocale(Locale(newLanguage));
                  // GetStorage().write(
                  //     'language', newLanguage); // Store selected language
                }
              },
              items: supportedLanguages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language.toUpperCase()),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
