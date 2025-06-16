import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData,{ super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Row(
              children: [
                Container(
                  width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: data['chosen_answer']==data['correct_answer'] ? Color.fromARGB(
                          255, 158, 230, 155) : Color.fromARGB(
                          255, 225, 122, 122),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(((data['index'] as int) + 1).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((data['question']) as String, style: GoogleFonts.lato(fontSize: 16, color: Colors.white,)),
                        const SizedBox(height: 5),
                        Text((data['chosen_answer']) as String, style: GoogleFonts.lato(fontSize: 14, color: Colors.red,),),
                        Text((data['correct_answer']) as String, style: GoogleFonts.lato(fontSize: 14, color: Colors.green,),),
                      ],
                    ),
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
