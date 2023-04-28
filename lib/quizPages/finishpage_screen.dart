import 'package:flutter/material.dart';
import 'package:my_app/additionalClasses/colors_in_app.dart';

class FinishPage extends StatefulWidget {
  final int score;
  final String chapter;
  final int questionCount;
  const FinishPage(this.chapter, this.score, this.questionCount, {Key? key})
      : super(key: key);
  @override
  State<FinishPage> createState() => _FinishPage();
}

class _FinishPage extends State<FinishPage> {
  final int maxSum =
      20; // max sum of good answers == sum of all questions, lets assume that it is always 20
  final Color col = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackGround.background(),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          //because I want to scroll if screen is too small
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _logo(),
              Divider(
                color: PageColor.questionColor,
                height: 5.0,
                thickness: 3.0,
              ),
              _quizTopic(), // title Text widget

              //   const SizedBox(height: 40.0),
              // _losewinComment(),
              const SizedBox(height: 50.0),
              Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 38, 44, 69),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: _losewinComment()),
              const SizedBox(height: 50.0),

              _scoreText(),

              _score(),
              const SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _newQuizButton(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'lub',
                      style: TextStyle(
                        color: PageColor.answerColor,
                        letterSpacing: 1.0,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MyFont1',
                      ),
                    ),
                  ),
                  _returnHomeButton(),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, bottom: 20),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                'Quiz',
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
        ],
      ),
    );
  }

  Widget _quizTopic() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.chapter,
            style: TextStyle(
              fontFamily: 'MyFont1',
              color: PageColor.questionColor,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreText() {
    return Text(
      "Twój wynik:",
      style: TextStyle(
        fontFamily: 'MyFont1',
        color: col,
        fontSize: 18.0,
      ),
    );
  }

// widget shows score
  Widget _score() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                    "Poprawnie:",
                    style: TextStyle(
                      fontFamily: 'MyFont2',
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                )),
                Expanded(
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color propably ot change
                      // borderRadius: const BorderRadius.all(Radius.circular(130)),
                      border: Border.all(
                        width: 1,
                        color: PageColor.trueAnswer,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${widget.score}",
                        style: TextStyle(
                          fontFamily: 'MyFont2',
                          color: PageColor.questionColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: [
                Expanded(
                  child: const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Text(
                      "Błędnie:",
                      style: TextStyle(
                        fontFamily: 'MyFont2',
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color propably ot change
                      // borderRadius: const BorderRadius.all(Radius.circular(130)),
                      border: Border.all(
                        width: 1,
                        color: PageColor.falseAnswer,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${widget.questionCount - widget.score}",
                        style: TextStyle(
                          fontFamily: 'MyFont2',
                          color: PageColor.questionColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _losewinComment() {
    if (widget.score >= widget.questionCount - 2) {
      return Text("Gratulacje!",
          style: TextStyle(
            fontFamily: 'MyFont1',
            color: PageColor.questionColor,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ));
    } else if (widget.questionCount / widget.score < 2) {
      return Text("Całkiem ok;)",
          style: TextStyle(
            fontFamily: 'MyFont1',
            color: PageColor.abcColor,
            fontSize: 35.0,
          ));
    } else {
      return Text("Nieźle...",
          style: TextStyle(
            fontFamily: 'MyFont1',
            color: PageColor.abcColor,
            fontSize: 35.0,
          ));
    }
  }

  Widget _newQuizButton() {
    return SizedBox(
      height: 60,
      width: 340,
      child: MaterialButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(
            color: PageColor.answerColor,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPRÓBUJ PONOWNIE',
              style: TextStyle(
                color: PageColor.abcColor,
                letterSpacing: 1.5,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'MyFont1',
              ),
            ),
          ],
        ),
      ),
    );
  }

  final ButtonStyle _raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: PageColor.background1,
    minimumSize: const Size(68, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
  );

  Widget _returnHomeButton() {
    return SizedBox(
      height: 50.0,
      width: 240.0,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(
            color: PageColor.abc2Color,
            width: 1.0,
          ),
        ),
        onPressed: () {
          Navigator.pop(context, false);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ZAKOŃCZ QUIZ',
              style: TextStyle(
                color: col,
                letterSpacing: 1.5,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'MyFont1',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
