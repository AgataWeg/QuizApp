// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PageColor {
  static final answerColor = Color.fromARGB(255, 255, 226, 192);
  static final questionColor = Color.fromARGB(255, 255, 140, 0);
  static final abcColor = Color.fromARGB(255, 255, 145, 82);
  static final abc2Color = Color.fromARGB(255, 255, 140, 0);
  static final Color trueAnswer = Color.fromARGB(255, 16, 150, 13);
  static final Color falseAnswer = Color.fromARGB(255, 206, 41, 41);

  static final startquizbutton = Color.fromARGB(255, 135, 121, 191);

  static final loginmailandpassword = Color.fromARGB(255, 164, 147, 234);
  static final entermailpas = Color.fromARGB(255, 68, 46, 155);
/*
  static final scoreColor = Color.fromARGB(255, 243, 0, 73);
  static final congrat_newRecordColor = Color.fromARGB(255, 255, 34, 101);
  static final notBadColor = Color.fromARGB(255, 222, 5, 70);
*/
  static final background1 = Color.fromARGB(255, 56, 53, 104);
  static final background2 = Color.fromARGB(255, 32, 30, 94);
  static final background3 = Color.fromARGB(255, 12, 11, 94);
}

class BackGround {
  static Widget background() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 26, 61),
      ),
    );
  }
}

class MyLogo {
  static Widget mylogo() {
    return Container(
      decoration: BoxDecoration(
        // color: PageColor.ABCColor,
        borderRadius: const BorderRadius.all(Radius.circular(70)),
        border: Border.all(
          width: 1,
          color: PageColor.answerColor,
        ),
      ),
      width: 200,
      height: 200,
      child: Image.asset('images/Slogowater2.png'),
    );
  }
}
