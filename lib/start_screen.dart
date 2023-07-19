import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', 
              height: 250,
              width: 250,
              color: const Color.fromARGB(150, 255, 255, 255)
          ),
          // Opacity(
          //   opacity: 0.5, 
          //   child: Image.asset('assets/images/quiz-logo.png', 
          //     height: 250,
          //     width: 250,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Text('Learn Flutter the fun way!', 
              style: GoogleFonts.vt323(
                fontSize: 20,
                color: Colors.white
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              }, 
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white, 
                  width: 1
                )
              ),
              icon: const Icon(Icons.arrow_right_alt, color: Colors.white,),
              label: const Text('Start Quiz', 
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}