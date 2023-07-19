import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTapAnswer, });

  final String answer;
  final void Function() onTapAnswer;

  @override
  Widget build(context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ElevatedButton(
        onPressed: onTapAnswer, 
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(150, 146, 97, 173),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ),
        child: Text(
          answer, 
          textAlign: TextAlign.center
        )
      ),
    );
  }
}