// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:my_app/quizPages/finishpage_screen.dart';
import 'package:my_app/additionalClasses/colors_in_app.dart';
import 'package:my_app/quizPages/question_model.dart';

// -------------------------- icons ----------------------------
const IconData arrowNext = IconData(0xf05bd, fontFamily: 'MaterialIcons');

const IconData trueIcon = IconData(0xf636, fontFamily: 'MaterialIcons');

const IconData falseIcon = IconData(0xf645, fontFamily: 'MaterialIcons');
const IconData sailingHome = IconData(0xf330, fontFamily: 'MaterialIcons');

class QestionPageDesign extends StatefulWidget {
  final List<QuestionModel> questions;
  final int quizid;
  final String chapter;
  final int questionCount;
  const QestionPageDesign(
      this.chapter, this.quizid, this.questions, this.questionCount,
      {Key? key})
      : super(key: key);
  @override
  State<QestionPageDesign> createState() => _QestionPageDesign();
}

class _QestionPageDesign extends State<QestionPageDesign> {
  // page conotroller - remember pages
  final PageController _controller = PageController(initialPage: 0);
  //
  bool pressed = false;
  List<bool> isPressed = [false, false, false];
  List<String> abclist = ['A.', 'B.', 'C.'];
  Color trueAnswer = Color.fromARGB(255, 16, 150, 13);
  Color falseAnswer = Color.fromARGB(255, 206, 41, 41);
  Color bordercolor = PageColor.answerColor;
  Color buttonColor = PageColor.answerColor;

  int score = 0; // score in current quiz round
  //int maxScore =
  // 0; // max score when solving quiz few times without visiting menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround.background(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            // building a lot of pages with PageView - for questions
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              // when page is changing
              onPageChanged: (page) {
                for (int i = 0; i < isPressed.length; i++) {
                  setState(() {
                    isPressed[i] = false;
                    pressed = false;
                  });
                }
              },
              itemCount: widget.questions.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
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
                      _quizTopic(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _showimage(widget.questions[index].image),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: _question(index),
                          ),
                          const SizedBox(height: 15.0),

                          //---------------------- answer buttons
                          for (int i = 0;
                              i < widget.questions[index].answer!.length;
                              i++)
                            _listAnswers(i, index),
                          // button next

                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: _nextfinishButton(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget isChecked(int i, bool isTrue) {
    if (pressed) {
      if (isTrue)
        return Icon(
          trueIcon,
          color: trueAnswer,
        );
      else
        return Icon(
          falseIcon,
          color: falseAnswer,
        );
    } else {
      return Text(
        "${abclist[i]}  ",
        style: TextStyle(
          color: PageColor.abc2Color, // Color.fromARGB(255, 190, 190, 190),
          fontSize: 16.0,
          fontFamily: 'MyFont2',
        ),
      );
    }
  }

  Widget _showimage(String? image) {
    if (image != null) {
      return Column(
        children: [
          const SizedBox(
            height: 7.0,
          ),
          Container(
            decoration: BoxDecoration(
              // color: PageColor.ABCColor,
              border: Border.all(
                width: 1,
                color: PageColor.answerColor,
              ),
            ),
            // color: PageColor.ABCColor,
            height: 140,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 7.0,
          ),
        ],
      );
    }
    return const SizedBox(
      height: 15.0,
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 1),
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('images/home.png',
                      color: PageColor.questionColor,
                      scale: 4,
                      filterQuality: FilterQuality.high),
                ),
              ],
            ),
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

  Widget _question(int index) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        "${index + 1}. ${widget.questions[index].question!}",
        style: TextStyle(
          color: PageColor.answerColor,
          fontSize: 28.0,
          fontFamily: 'MyFont1',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _listAnswers(int i, int index) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0, left: 1.0, right: 10.0),
      //padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              /*  OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  side: BorderSide(
                    color: isPressed[i]
                        ? (widget.questions[index].answer!.entries
                                .toList()[i]
                                .value
                            ? trueAnswer
                            : falseAnswer)
                        : PageColor.questionColor,
                    width: 1.0,
                  ),
                ),
                child: isChecked(i,
                    widget.questions[index].answer!.entries.toList()[i].value),
              ),*/
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 2.0),
                child: isChecked(i,
                    widget.questions[index].answer!.entries.toList()[i].value),
              ),
              Expanded(
                child: MaterialButton(
                  color: isPressed[i]
                      ? (widget.questions[index].answer!.entries
                              .toList()[i]
                              .value
                          ? trueAnswer
                          : falseAnswer)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    side: BorderSide(
                      color: isPressed[i]
                          ? (widget.questions[index].answer!.entries
                                  .toList()[i]
                                  .value
                              ? trueAnswer
                              : falseAnswer)
                          : ((pressed &&
                                  widget.questions[index].answer!.entries
                                      .toList()[i]
                                      .value)
                              ? trueAnswer
                              : PageColor.answerColor),
                      width: 1.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                  onPressed: () {
                    for (int i = 0;
                        i < widget.questions[index].answer!.length;
                        i++)
                      if (isPressed[i]) {
                        return;
                      }
                    setState(() {
                      isPressed[i] = true;
                      pressed = true;
                    });
                    if (widget.questions[index].answer!.entries
                        .toList()[i]
                        .value) {
                      score += 1;
                    }
                  },
                  child: Text(
                    widget.questions[index].answer!.keys.toList()[i],
                    style: TextStyle(
                      color:
                          isPressed[i] ? Colors.white : PageColor.answerColor,
                      letterSpacing: 0.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont2',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nextfinishButton(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {
            index + 1 == widget.questions.length
                ? {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinishPage(widget.chapter,
                                score, widget.questionCount))).then((value) {
                      if (!value) {
                        Navigator.pop(context);
                      } else {
                        score = 0;
                        _controller.jumpToPage(0);
                      }
                    }),
                  }
                : _controller.nextPage(
                    duration: Duration(microseconds: 700),
                    curve: Curves.bounceIn);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index + 1 == widget.questions.length)
                Text(
                  'Zakończ',
                  style: TextStyle(
                    color: PageColor.answerColor,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MyFont1',
                  ),
                )
              else
                Icon(
                  arrowNext,
                  color: PageColor.answerColor,
                  size: 50.0,
                )
            ],
          ),
        ),
      ],
    );
  }
}
