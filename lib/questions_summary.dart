import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(  
          children: 
            summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['correct_answer'] == data['chosen_answer'] ? Colors.lightBlue.shade200: Colors.pink.shade200,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(), 
                      style: const TextStyle(
                        color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String, 
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                          )
                        ),
                        const SizedBox(height: 2,),
                        Text(
                          data['correct_answer'] as String, 
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.pink.shade200,
                          ),
                        ),
                        Text(
                          data['chosen_answer'] as String, 
                          style: GoogleFonts.lato(
                            color: Colors.lightBlue.shade200,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5,)
                      ],
                   ),
                  )
                ],
              );
            }).toList(),
        ),
      ),
    );      
  }
}