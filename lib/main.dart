import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/login/forget_password.dart';
import 'modules/login/login.dart';
import 'modules/on_boarding/on_boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // to make app all support  arabic language
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''),
      ],
      home: ForgetPassword(),
    );
  }
}
