import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_screen.dart';
import 'package:second_app/result_screen.dart';

import 'package:second_app/text_now.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen = 1;
  // @override
  // void initState() {
  // activeScreen = TextImage(switchScreen);
  //super.initState();
  // }
  void switchScreen() {
    setState(() {
      activeScreen = 2;
    });
  }

  void chooseAnswer(String ans) {
    selectedAnswer.add(ans);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        
        activeScreen = 3;
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 2;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = TextImage(switchScreen);

    if (activeScreen == 2) {
      screenWidget = QuestionScreen(onSelectans: chooseAnswer);
    }
    if(activeScreen == 3) {
      screenWidget =  ResultsScreen(chosenAnswer: selectedAnswer,onRestart: restartQuiz,);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: screenWidget,
      ),
    ));
  }
}
