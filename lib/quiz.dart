import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({ super.key });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // question marks saying that it can be null before initState

  // @override
  // void initState() {
  //   activeScreen = StartQuiz(switchScreen);
  //   super.initState();
  // }

  // other way to do it

  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void appendAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void restartQuiz () {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'quiz-screen';
    });
  }

  @override
  Widget build(context) {
    Widget? screenWidget;

    if(activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    } else if(activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, restartQuiz: restartQuiz,);
    } else {
      screenWidget = QuestionsScreen(
        onSelectAnswer: appendAnswer);
    }
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(73,0,145,1),
          ), 
        child: screenWidget
        ) 
      )
    );
  }
}