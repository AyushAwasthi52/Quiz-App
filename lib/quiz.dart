import 'package:flutter/material.dart';

import './Gradient_Container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GradientContainer([
            Color.fromARGB(255, 103, 58, 183),
            Color.fromARGB(255, 81, 45, 168)
          ]),
        ),
      ),
    );
  }
}
