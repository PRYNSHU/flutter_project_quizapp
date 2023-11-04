import 'package:flutter/material.dart';
import 'package:flutter_project_quizapp/result_screen.dart';
import 'package:flutter_project_quizapp/start_screen.dart';
import 'package:flutter_project_quizapp/question_screen.dart';
import 'package:flutter_project_quizapp/data/question_list.dart';

//main widget which manage's question and start screen
class Quiz extends StatefulWidget {
  const Quiz({super.key}); //get the functionality of parent class

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectAnswer = [];
  var activeScreen = 'start';

  // @override
  // Called when this object is inserted into the tree/after obj creation.
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen); //fun as an argument wow!
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question'; //internal state of the obj changed
    });
  }

  void resetAns(){
    setState(() {
      selectAnswer = [];
    });
  }

  void chooseAnswer(answer) {
    selectAnswer.add(answer);
    // print(answer);

    //to stop the execution
    if (selectAnswer.length == questions.length) {
      setState(() {
        // selectAnswer = [];
        activeScreen = 'result';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenwidget = StartScreen(switchScreen); //switchscreen as value

    //change to question screen
    if (activeScreen == 'question') {
      screenwidget = QuestionScreen(onselectAnswer: chooseAnswer);
    }
    //change to result screen
    else if (activeScreen == 'result') {
      screenwidget = ResultScreen(
        chooseAnswer: selectAnswer,
        changeScreen: switchScreen,
        reset: resetAns,
      );
    }

    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: Color.fromARGB(255, 212, 123, 222),
          // ),

          // textTheme: const TextTheme(
          //   displayLarge: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 162, 14, 178),
        body: Container(
          //ternary operator can be used
          // child: activeScreen == "start"
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
          child: screenwidget,
        ),
      ),
    );
  }
}
