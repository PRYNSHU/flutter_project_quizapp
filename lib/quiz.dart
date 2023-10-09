import 'package:flutter/material.dart';
import 'package:flutter_project_quizapp/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  @override
  Widget build(context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 162, 14, 178),
        ),

        // textTheme: const TextTheme(
        //   displayLarge: TextStyle(
        //     fontSize: 18,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),

      home: const Scaffold(
        backgroundColor:Color.fromARGB(255, 162, 14, 178),
        body: StartScreen(),
      ),
    );
  }
}