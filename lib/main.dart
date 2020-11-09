import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
QuizeBrain quizeBrain=QuizeBrain();
void main() {
  runApp(Quizer());
}
class Quizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(

              child: Quizee(),
            ),
        )
    );
  }
}
class Quizee extends StatefulWidget {
  @override
  _QuizeeState createState() => _QuizeeState();
}

class _QuizeeState extends State<Quizee> {
  List<Icon> scorekeeper=[];
//  List<String> questions=[
//    'Human blood is green',
//    'Expanded widget used for row and column',
//    'Flatton button has color\'s intially '
//  ];
//  List<bool> answers=[
//    false,
//    true,
//    false,
//  ];


  void correctAnswers()
  {
    bool correctAnswer = quizeBrain.getQuestionAns();
    setState(() {
    if(quizeBrain.isFinished()) {
      var alertStyle = AlertStyle(
        animationType: AnimationType.fromRight,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );
      Alert(context: context,
          style: alertStyle,
          type: AlertType.error,
          title: 'Question ended',
          desc: 'you have reached end of the code',
      buttons: [DialogButton(
        child: Text('finish',style: TextStyle(fontSize: 20.0,color: Colors.white),
        ),
        onPressed: ()=>Navigator.pop(context),
        radius: BorderRadius.circular(0.0),
        width: 120.0,
      ),
      ]).show();
      quizeBrain.reset();
      scorekeeper=[];
    }
    else if(correctAnswer==true)
    {
      scorekeeper.add(Icon(Icons.check,color: Colors.green,),);
    }
    else
    {
      scorekeeper.add(Icon(Icons.close,color: Colors.red,),);
    }
    quizeBrain.nextQuestion();
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(quizeBrain.getQuestionText(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(

              onPressed: (){
                correctAnswers();

              },
              color: Colors.green,
              child: Text('True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: ()
              {
                correctAnswers();

              },
              color: Colors.red,
              child: Text('Flase',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
