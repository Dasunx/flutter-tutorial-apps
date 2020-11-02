import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(EasyLocalization(
    supportedLocales: [Locale('en', ''), Locale('si', ''), Locale('es', '')],
    path: 'assets/translations', // <-- change patch to your
    fallbackLocale: Locale('en', ''),
    child: BMICalculator()));

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          fontFamily: context.locale.toString() == 'si' ? 'SAMADI' : 'JOHN'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: InputPage(),
    );
  }
}
