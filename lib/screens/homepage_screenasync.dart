// ignore_for_file: curly_braces_in_flow_control_structures

//---------------------- Example ------------------------
// 1. _sailingName(...) function create new Quiz and
// if I would like to add new quiz, then given arguments example:
// example:
// index = 1; // id of quizz 0,1,2...
// qu = abouSignsQuestions; // question list
// name = "Signs"; // main topic of quizz
//-------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:my_app/additionalClasses/colors_in_app.dart';
import 'package:my_app/quizPages/question_list.dart';
import 'package:my_app/quizPages/question_model.dart';
import 'package:my_app/quizPages/questionpages_design.dart';

// -------------------------- icons ----------------------------
const IconData watter = IconData(0xe6d0, fontFamily: 'MaterialIcons');

class HomePageScreenasync extends StatefulWidget {
  const HomePageScreenasync({Key? key}) : super(key: key);
  @override
  State<HomePageScreenasync> createState() => _HomePageScreenasync();
}

class _HomePageScreenasync extends State<HomePageScreenasync> {
  // ----------------------------------------------
  // change if more lists
  static int listsCount = 3;
  // ----------------------------------------------

  List<int> questionCount = List.filled(listsCount, 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              Text(
                'Quiz',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: PageColor.questionColor,
                  letterSpacing: 0.7,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'MyFont1',
                ),
              ),
              const Text(
                'App',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 0.7,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,

                  //fontFamily: 'MyFont1',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(
            255, 62, 69, 94), //Color.fromARGB(255, 36, 34, 93),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              watter,
              color: Colors.grey,
              size: 30,
            ),
          )
        ], //to bedzie przycisk
      ),
      body: Stack(
        children: <Widget>[
          BackGround.background(),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 10.0,
              ),
              child: Column(children: <Widget>[
                //_buildLogoutBtn(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wybierz ",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'MyFont1',
                        color: PageColor.questionColor,
                        fontSize: 23.0,
                      ),
                    ),
                    Text(
                      "Quiz",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'MyFont1',
                        color: PageColor.questionColor,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70),
                  child: Divider(
                    color: PageColor.questionColor,
                    height: 9.0,
                    thickness: 3.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _sailingName(0, abouTheoryQuestions, "Teoria"),

                //_sailingName(1, abouSignsQuestions, "Znaki"),

                _sailingName(2, aboutBuildQuestions, "Budowa jachtu"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/kolo_obr.png',
                        scale: 6, filterQuality: FilterQuality.high),
                    Image.asset('images/ioc_jach2.png',
                        color: PageColor.abc2Color,
                        scale: 6,
                        filterQuality: FilterQuality.high),
                  ],
                ),
                //----------------------------
                // other quizes in the future
                //----------------------------
              ]),
            ),
          ),
        ],
      ),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: PageColor.abcColor,
    //minimumSize: Size(68, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  Widget _quizName(String text) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: PageColor.answerColor,
            letterSpacing: 1.5,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'MyFont1',
          ),
        ),
      ],
    );
  }

  Widget _startQuizButton(
      List<QuestionModel> questions, int index, String chapter) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide(
          color: PageColor.answerColor,
          width: 1.0,
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QestionPageDesign(
                    chapter, index, questions, questionCount[index])));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          child: Center(
            child: Text(
              'Rozwiąż Quiz',
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Colors.grey, //PageColor.abcColor, //
                letterSpacing: 1.5,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'MyFont1',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sailingName(int index, List<QuestionModel> qu, String name) {
    // example:
    // index = 1; // id of quizz 0,1,2...
    // qu = abouSignsQuestions; // question list
    // name = "Signs"; // main topic of quizz
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 44, 69),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                //border: Border.all(
                //width: 1,
                //color: PageColor.answerColor,
                //),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(child: _quizName(name)),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(child: _liczbaPytan(index)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _startQuizButton(qu, index, name),
                ],
              ),
            )),
      ],
    );
  }

  Widget _liczbaPytan(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Liczba pytań:",
            textScaleFactor: 1.0,
            style: TextStyle(
              color: PageColor.abcColor,
              letterSpacing: 1.0,
              fontSize: 20.0,
              fontFamily: 'MyFont1',
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    side: BorderSide(
                      color: questionCount[index] == 10
                          ? PageColor.abcColor
                          : Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      questionCount[index] = 10;
                    });
                  },
                  child: Text(
                    '10',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: questionCount[index] == 10
                          ? PageColor.abcColor
                          : Colors.grey, //PageColor.abc2Color,
                      letterSpacing: 0.1,
                      fontSize: 14.0,
                      // fontWeight: FontWeight.bosld,
                      fontFamily: 'MyFont1',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    side: BorderSide(
                      color: questionCount[index] == 25
                          ? PageColor.abcColor
                          : Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      questionCount[index] = 25;
                    });
                  },
                  child: Text(
                    '25',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: questionCount[index] == 25
                          ? PageColor.abcColor
                          : Colors.grey,
                      letterSpacing: 0.1,
                      fontSize: 14.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont1',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    side: BorderSide(
                      color: questionCount[index] == 40
                          ? PageColor.abcColor
                          : Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      questionCount[index] = 40;
                    });
                  },
                  child: Text(
                    '40',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: questionCount[index] == 40
                          ? PageColor.abcColor
                          : Colors.grey,
                      letterSpacing: 0.1,
                      fontSize: 14.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont1',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _whileWaiting() {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                PageColor.background1,
                PageColor.background2,
                PageColor.background3,
              ],
              stops: const [0.15, 0.6, 0.9],
            ),
          ),
        ),
        Center(
            child: CircularProgressIndicator(
          color: PageColor.abcColor,
        )),
      ],
    );
  }
}
