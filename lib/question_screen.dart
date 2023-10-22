import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_quizapp/ans_button.dart';
import 'package:flutter_project_quizapp/data/question_list.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onselectAnswer});

  // a function that take a value and return nothing
  final void Function(String answer) onselectAnswer; 

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;

  void clickAnswerButton(String myanswer){
    widget.onselectAnswer(myanswer);

    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[index];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              currentquestion.quest,
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color.fromARGB(255, 245, 202, 246),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 20,
            ),
            //using map fun, we iterate every list item and convert it
            //to another form(list of string to lst to widgets)
            //(...) called spreading operator, nested list to single lists
            ...currentquestion.shuffledfun().map((item) {
              return AnswerButton(
                item,
                () {
                  clickAnswerButton(item);
                },
              );
            }),
            // AnswerButton(currentquestion.answers[0], () {}),
          ],
        ),
      ),
    );
  }
}
