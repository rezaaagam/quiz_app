import 'package:flutter/material.dart';
import 'package:quiz_app1/question.dart';

import 'package:quiz_app1/answer.dart';
import 'package:quiz_app1/quiz.dart';
import 'package:quiz_app1/result.dart';

//void main() {
//  runApp(const MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
final _questions = const[
      {
        'questionText' : 'What\'s your favorite color?',
        'answers' : [
          {'text' : 'Black', 'score' : 10},
          {'text' : 'Blue', 'score' : 8},
          {'text' : 'Red', 'score' : 5},
          {'text' : 'Green', 'score' : 3},
          {'text' : 'Yellow', 'score' : 1},
        ],
      },
      {
        'questionText' : 'What\'s your favorite Animal?',
        'answers' : [
          {'text' : 'Cat', 'score' : 10},
          {'text' : 'Dog', 'score' : 8},
          {'text' : 'Pig', 'score' : 3},
          {'text' : 'Gekko', 'score' : 7},
          ],
      },
      {
        'questionText' : 'What\'s your favorite Day?',
        'answers' : [
          {'text' : 'Monday', 'score' : 3},
          {'text' : 'Tuesday', 'score' : 4},
          {'text' : 'Wednesday', 'score' : 5},
          {'text' : 'Thursday', 'score' : 8},
          {'text' : 'Friday', 'score' : 6},
          {'text' : 'Satuday', 'score' : 7},
          {'text' : 'Sunday', 'score' : 10},
          ],
      },
    ];
  var _questionIndex= 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
 void _answerQuestion(int score){

  _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('Kami punya pertanyaan lagi!');

    }else{
      print('Sudah tidak ada pertanyaan!');
    }
    
  }

   @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
        title: Text('Quiz'),
      
      ),
      body: _questionIndex < _questions.length

       ?Quiz(
        answerQuestion: _answerQuestion,
        questionIndex: _questionIndex,
        questions: _questions,
      )
        : Result(_totalScore, _resetQuiz),
        ),
      );
  }
}