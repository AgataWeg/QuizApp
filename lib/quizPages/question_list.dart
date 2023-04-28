import 'package:my_app/quizPages/question_model.dart';

List<QuestionModel> abouTheoryQuestions = [
  QuestionModel("Wiatr pozorny to:", {
    "wiatr doświadczany przez poruszający się obiekt": true,
    "wiatr doświadczany przez obiekt w bezruchu": false,
    "kombinacja dwóch powyższych": false,
  }),
  QuestionModel(
    "Aby zwrot był efektywny, maksymalny kąt wychylenia steru to:",
    {
      "70 stopni": false,
      "50 stopni": false,
      "30 stopni": true,
    },
  ),
  QuestionModel(
    "Dryf jest minimalizowany głównie dzięki:",
    {
      "sile aerodynamicznej, która powoduje ruch żaglówki": false,
      "mieczowi, kiedy jest opuszczony, pod wodą": true,
      "mieczowi, kiedy jest podniesiony, w skrzynce mieczowej": false,
    },
  ),
];

List<QuestionModel> aboutBuildQuestions = [
  QuestionModel(
      "Wskazana część olinowania stałego to:",
      {
        "sztormrelign": false,
        "wanta topowa": false,
        "topenanta": true,
      },
      "images/signs_quiz/sailing_boat.png"),
];
