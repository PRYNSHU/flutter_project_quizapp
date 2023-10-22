import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((item) {
            return Row(
              children: [
                Text(((item['question-index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(item['question'] as String),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(item['selectedAnswer'] as String),
                      Text(item['correctAnswer'] as String),
                    ],
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
