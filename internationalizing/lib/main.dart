import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    if (state != null) {
      state.setLocale(newLocale);
    }
  }
}

class _MyAppState extends State<MyApp> {
  Locale locale = Locale(Platform.localeName.substring(0, 2));

  @override
  Widget build(BuildContext context) => MaterialApp(
        locale: locale,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
      );

  void setLocale(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }
}
