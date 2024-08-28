import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newbornCare/consist/BabyCareType.dart';
import 'package:newbornCare/consist/Header.dart';
import 'package:newbornCare/consist/MyTimePicker.dart';

void main() {
  runApp(NewBornCare());
}

class NewBornCare extends StatelessWidget {
  NewBornCare({super.key});

  int selectedIndex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 国际化
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('zh')],
      locale: const Locale('zh'),
      home: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Header(),
            const MyTimePicker(),
            Container(
              height: 600,
              color: Colors.deepOrangeAccent,
              child: const Text('Hello World'),
            ),
            const BabyCareType()
          ],
        ),
      )
    );
  }
}
