import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchState);
    super.initState();
  }

  void switchState() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }
  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          activeScreen = ResultScreen(
            chosenAnswers: selectedAnswers,
              onRestart: onRestart,
          );

        },
      );
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // colors: [Color(0xFF000957), Color(0xFF344CB7)],
              colors: [Color(0xFF16404D), Color(0xFFA6CDC6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
