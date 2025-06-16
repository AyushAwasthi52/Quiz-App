import 'package:flutter/material.dart';
import './Home_Page.dart';
import './Questions.dart';
import './data/questions.dart';
import './Result_Screen.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer(this.color, {super.key});
  final List<Color> color;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  var ActiveScreen = 'home-screen';
  List<String> answers = [];
  @override
  void ChangeScreen(){
    setState(() {
      ActiveScreen = 'questions-screen';
    });
  }

  void addAnswer(String ans){
    answers.add(ans);
    if (answers.length == questions.length){
      setState(() {
        ActiveScreen = 'result_screen';
      });
    }
  }

  void reset(){
    answers = [];
    setState(() {
      ActiveScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget Active = HomeScreen(ChangeScreen);
    if (ActiveScreen == 'questions-screen') Active = Questions(addAnswer);
    if (ActiveScreen == 'result_screen') Active = ResultScreen(reset: reset,answers: answers,);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: widget.color,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
      ),
      child: Active,
    );
  }
}