
import 'package:flutter/material.dart';
import 'package:bmicalculator/components/reuseable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/bottom_button.dart';
class  Result extends StatelessWidget {
  Result({@required  this.bmiValue,@required this.resultText,@required this.interprretation});
  final String bmiValue;
  final String resultText;
  final String interprretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Container(
                padding:EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',style: kResultTittleTextStyle,))
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(colur:kInActiveCardColor,cardChild:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiValue,style: kBMIVAlueTextStyle,
                    ),
                    Text(interprretation,
                        style: kBodyBMITextStyle,
                    textAlign: TextAlign.center),

                  ],
                ),),
            ),
            BottomButton(buttonTittle: 'RE-CALCULATE',
            onTap: ()
              {
                Navigator.pop(context);
              },)
          ],
        ),

      );
  }
}
