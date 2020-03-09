import 'package:flutter/material.dart';
import 'question_bank.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('퀴즈대잔치'),
        ),
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Quizzler(),
          ),
        ),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> answers = [];

  QuestionBank questionBank = QuestionBank();

  void checkAnswer(bool selectAnswer) {
    if (questionBank.getQuestionAnswer() == selectAnswer) {
      answers.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      answers.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }

    questionBank.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                });
              },
              child: Text('YES'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                });
              },
              child: Text('NO'),
            ),
          ),
        ),
        Row(
          children: answers,
        )
      ],
    );
  }
}
