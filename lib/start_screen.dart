import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(178, 188, 93, 222),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Flutter Learning!",
            style: TextStyle(
                color: Color.fromARGB(255, 240, 227, 250), fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.outbond_rounded),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              elevation: 18,
              backgroundColor: const Color.fromARGB(255, 187, 51, 246),
              foregroundColor: const Color.fromARGB(255, 246, 244, 240),
            ),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
