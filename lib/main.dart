import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/screens/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(child:
      MaterialApp(
        title: "Riverpod starter",
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('ko', '')
        ],
        home: HomeScreen())
      )
  );
}
