import 'package:flutter/material.dart';
import 'package:flutter_project_quizapp/ans_button.dart';
import 'package:flutter_project_quizapp/data/question_list.dart';
import 'package:flutter_project_quizapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer});

  final List<String> chooseAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].quest,
        'selectedAnswer': chooseAnswer[i],
        'correctAnswer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("out of  are correct"),
            const SizedBox(
              height: 10,
            ),
            // ...chooseAnswer.map((item) {
            //   return Text(item);
            // }),
            QuestionSummary(summarydata: getSummaryData()),

            const SizedBox(
              height: 10,
            ),

            TextButton(
              onPressed: () {},
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
