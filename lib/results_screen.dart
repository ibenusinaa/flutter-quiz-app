import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'chosen_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0] //the correct one always answer number 1
      });

      // if (chosenAnswers[i] == questions[i].answers[0]) {
      //   correctAnswer++;
      // }
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final int numTotalQuestions = questions.length;
    final int numCorrectQuestions = summaryData.where((element) {
      return element['chosen_answer'] == element['correct_answer'];
    }).length;

    // we can also use for loop
    // for (var i = 0; i < summaryData.length; i++) {
    //   if (summaryData[i]['chosen_answer'] == summaryData[i]['correct_answer']) {
    //     numCorrectQuestions++;
    //   }
    // }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {
                restartQuiz();
              },
              icon: const Icon(Icons.restart_alt, 
                color: Colors.white
              ),
              label: const Text('Restart Quiz', 
              style: TextStyle(
                color: Colors.white),
              )
            ),
          ],
        ),
      ),
    );
  }
}
