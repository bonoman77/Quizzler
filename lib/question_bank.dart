import 'question.dart';

class QuestionBank {
  int quizNumber = 0;

  List<Question> _quizList = [
    Question('C#은 객체지향언어입니까?', true),
    Question('Dart는 객체지향언어입니까?', true),
    Question('C++은 객체지향언어입니까?', true),
    Question('C는 객체지향언어입니까?', false),
    Question('Flutter는 할만합니까?', true),
    Question('올해는 편안합니까?', false),
  ];

  bool nextQuestion() {
    if (quizNumber < _quizList.length - 1) {
      quizNumber++;
      print(quizNumber);
    }
  }

  String getQuestionText() {
    return _quizList[quizNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _quizList[quizNumber].questionAnswer;
  }
}
