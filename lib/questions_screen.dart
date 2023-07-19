import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState () {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;
  int questionLength = questions.length;
  
  
  void onTapAnswer(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (questionIndex <= questionLength) {
        questionIndex = questionIndex + 1;
      } else {
        
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question, 
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // for (var i = 0; i<currentQuestion.getShuffledAnswers().length; i++ ) 
            //   AnswerButton(answer: currentQuestion.answers[i], onTapAnswer: () {}),
            // other way using map
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return  AnswerButton(
                answer: answer, 
                onTapAnswer: () {
                  onTapAnswer(answer);
              });
            })
          ],
        ),
      ),
    );
  }
} 