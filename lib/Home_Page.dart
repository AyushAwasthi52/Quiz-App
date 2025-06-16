import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen(this.ChangeScreen, {super.key});
  final void Function() ChangeScreen;
  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300, color: Color.fromARGB(
              55, 244, 243, 243),),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Text("Learn Flutter the Fun Way",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          OutlinedButton.icon(onPressed: (){ChangeScreen();},
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)), ),
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: Text("Start Quiz")),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}