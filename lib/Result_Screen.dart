import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './data/questions.dart';
import './Question_Summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.reset, required this.answers, super.key});
  final List<String> answers;
  final void Function() reset;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];

    for (var i=0 ; i<answers.length ; i++){
      summary.add({
        'index': i,
        'question' : questions[i].question,
        'correct_answer' : questions[i].answer[0],
        'chosen_answer' : answers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final totalAnswers = answers.length;
    final correctAnswers = summaryData.where((data){
      return data['correct_answer']==data['chosen_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have chosen $correctAnswers out of $totalAnswers correct answers',
              style: GoogleFonts.lato(fontSize: 24, color: Color.fromARGB(
                  255, 207, 159, 243),
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            QuestionSummary(summaryData),
            SizedBox(height: 30,),
            TextButton.icon(
                onPressed: reset,
                icon: Icon(Icons.restart_alt_rounded, color: Colors.white,),
                label: Text("Restart Quiz", style: TextStyle(color: Colors.white, fontSize: 18),)),
          ],
        ),
      ),
    );
  }
}
