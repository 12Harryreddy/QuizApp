import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.sora(
                color: const Color(0xFFFBF5DD),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AnswerButton(onTap: () {
                    answerQuestion(item);
                  }, text: item),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
