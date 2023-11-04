import 'package:flutter/material.dart';
import 'package:flutter_project_quizapp/ans_button.dart';
import 'package:flutter_project_quizapp/data/question_list.dart';
import 'package:flutter_project_quizapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chooseAnswer,
    required this.changeScreen,
    required this.reset,
  });

  final void Function() reset;
  final List<String> chooseAnswer;
  final void Function() changeScreen;

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
    final summaydata = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectAns = summaydata.where((item) {
      return item['selectedAnswer'] == item['correctAnswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answerd $numCorrectAns out of $numTotalQuestion correct questions!",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
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

            AnswerButton("Restart", () {
              changeScreen();
              reset();
            }),
            // ElevatedButton.icon(
            //   icon: const Icon(Icons.restore_outlined),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(222, 36, 7, 155),
            //     foregroundColor: Colors.white,
            //   ),
            //   onPressed: () {
            //     changeScreen();
            //     reset();
            //   },
            //   label: const Text("Restart"),
            // ),
          ],
        ),
      ),
    );
  }
}
