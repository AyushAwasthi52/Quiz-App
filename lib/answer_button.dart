import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.text, this.func, {super.key});
  final String text;
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: func,
        style: ElevatedButton.styleFrom(foregroundColor:Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Color.fromARGB(255, 33 , 1, 95),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
        child: Text(text, textAlign: TextAlign.center,));
  }
}
