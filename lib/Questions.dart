import 'package:flutter/material.dart';
import './answer_button.dart';
import './data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.onSelectAnswers, {super.key});
  final void Function(String) onSelectAnswers;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var question_index = 0;
  void answerQuestion(String ans){
    widget.onSelectAnswers(ans);
    setState(() {
      question_index++;
    });
  }
  @override
  Widget build(BuildContext context) {
    var current_question = questions[question_index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(current_question.question, style: GoogleFonts.lato(fontSize: 24, color: Color.fromARGB(255, 201, 153, 251), fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            ...current_question.getShuffledList().map((text){
              return Answer(text, (){
                answerQuestion(text);
              });
            })
          ],
        ),
      ),
    );
  }
}
