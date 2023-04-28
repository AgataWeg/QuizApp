// ignore_for_file: curly_braces_in_flow_control_structures, use_key_in_widget_constructors

//------------------------- ATTENTION ------------------
// 1. when new account has been just created, at first I have to (solve every quizz once (no meter how well)
// and then log out) or (at first manually create fields in database)
// 2. Sign in process is probably useless so far

import 'package:flutter/material.dart';
import 'package:my_app/screens/homepage_screenasync.dart';

// navigatorKey is helpfull when changing beetwen "log in" and "sign up" modes
// without context

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sailing Quizz',
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const HomePageScreenasync();
  }
}
