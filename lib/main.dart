import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/screens/home_screen.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const HomeScreen()
    );
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      // To install Riverpod, we need to add this widget above everything else.
      // This should not be inside "MyApp" but as direct parameter to "runApp".
      // Riverpod을 설치하기 위해서, 모든 위젯 위에 ProviderScope가 있어야 합니다.
      // "App"단 안에 있으면 안되며, runApp의 바로 아래에 인자로 있어야 합니다.
      ProviderScope(child:
        EasyLocalization(
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          supportedLocales: const [
            Locale('en'),
            Locale('ko')
          ],

          useOnlyLangCode: true,
          child: MyApp()
        )

    )
  );
}
