import 'package:flutter/material.dart';
import 'QuizBrain.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain=QuizBrain();

  void checkAnswer(bool userAnswer){
    setState(() {

      bool ans=quizBrain.getAnswer();
      if(ans==userAnswer) {
        scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            )
        );
      }
      else{
        scoreKeeper.add(
            Icon(
              Icons.clear,
              color: Colors.red,
            )
        );
      }
      quizBrain.changeQuestion();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
               checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

// import 'package:flutter/material.dart';
// import 'QuizBrain.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// void main() => runApp(Quizzler());
//
// class Quizzler extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   Quizbrain quizbrain= Quizbrain();
//   List<Icon> scoreKeeper=[];
//   int myscore=0;
//
//   Icon result(IconData iconData,Color color){
//     return Icon(
//       iconData,
//       color: color,
//     );
//   }
//   void checkAnswer(bool userAnswer){
//
//     setState(() {
//     if(quizbrain.isFinished()==true){
//       Alert(
//         context: context,
//         type: AlertType.error,
//         title: "FINISHED",
//         desc: "YOUR SCORE IS:$myscore",
//         buttons: [
//           DialogButton(
//             child: Text(
//               "TRY AGAIN",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             onPressed: () => Navigator.pop(context),
//             width: 120,
//           )
//         ],
//       ).show();
//       quizbrain.isFinished();
//       quizbrain.reset();
//       scoreKeeper.clear();
//     }
//     else {
//       bool ans = quizbrain.getAnswer();
//       if (userAnswer == ans) {
//         // print("correct");
//         scoreKeeper.add(result(Icons.check, Colors.green));
//         myscore++;
//       }
//       else {
//         scoreKeeper.add(result(Icons.clear, Colors.red));
//       }
//         quizbrain.nextQuestion();
//     }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 quizbrain.getQuestion(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: FlatButton(
//               textColor: Colors.white,
//               color: Colors.green,
//               child: Text(
//                 'True',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//               onPressed: () {
//                 //The user picked true.
//                 checkAnswer(true);
//               },
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: FlatButton(
//               color: Colors.red,
//               child: Text(
//                 'False',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 //The user picked false.
//                 checkAnswer(false);
//               },
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         )
//       ],
//     );
//   }
// }
//
// /*
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
// */
