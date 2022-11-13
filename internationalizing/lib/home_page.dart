import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internationalizing/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.helloWorld),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  MyApp.setLocale(
                      context,
                      AppLocalizations.of(context)!.localeName == 'en'
                          ? const Locale('ar')
                          : const Locale('en'));
                },
                child: Text(AppLocalizations.of(context)!.localeName == 'en'
                    ? 'عربي'
                    : 'English'),
              ),
            ],
          ),
        ),
      );
}
