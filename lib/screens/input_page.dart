import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/components/reuseable_card.dart';
import 'package:bmicalculator/components/card_content.dart';
import 'package:bmicalculator/constants.dart';
import 'result_page.dart';
import 'package:bmicalculator/components/rounded_icon.dart';
import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/calculator_brain.dart';


enum Gender{
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 // Color maleCardColor=inActiveCardColor;
 // Color femaleCardColor=inActiveCardColor;
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=30;

  //male=1,female=2
/*  void updateColor(Gender selectedGender)
  {
//    selectedGender==Gender.MALE?(maleCardColor==inActiveCardColor?maleCardColor=activeCardColor:maleCardColor=inActiveCardColor):
//    (femaleCardColor==inActiveCardColor?femaleCardColor=activeCardColor:femaleCardColor=inActiveCardColor);
    if(selectedGender==Gender.MALE)
      {
        if(maleCardColor==inActiveCardColor)
          {
            maleCardColor=activeCardColor;
            femaleCardColor=inActiveCardColor;
          }
        else {
          maleCardColor=inActiveCardColor;
        }

      }
    else{
      if(femaleCardColor==inActiveCardColor)
        {
          femaleCardColor=activeCardColor;
          maleCardColor=inActiveCardColor;
        }
      else{
        femaleCardColor=inActiveCardColor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALUCALATER'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.MALE;
                    });
                  },
                  colur: selectedGender==Gender.MALE?kActiveCardColor:kInActiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE'),
                  ),
                ),
              Expanded(

                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.FEMALE;
                    });
                  },colur:selectedGender==Gender.FEMALE?kActiveCardColor:kInActiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),)
              )
            ],
          )
          ),
          Expanded(child: ReusableCard(colur:kActiveCardColor,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: kLabelStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                   Text(height.toString(),
                      style:kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor:Color(0x29EB1555),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: kSliderMinValue,
                    max: kSliderMaxValue,
                    onChanged: (double heightNewValue)
                    {
                      setState(() {
                        height=heightNewValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          ),
          Expanded(child: Row(
                  children: <Widget>[
                 Expanded(
                  child: ReusableCard(colur:kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: kLabelStyle,),
                        Text(weight.toString(),style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIcon(icon:FontAwesomeIcons.minus,onPressed:()
                              {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIcon(icon:FontAwesomeIcons.plus,onPressed:()
                            {
                              setState(() {
                                weight++;
                              }
                              );
                            },
                            ),
                          ],
                        ),
                      ],
                    ),),
              ),
              Expanded(
                  child: ReusableCard(colur:kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: kLabelStyle),
                        Text(age.toString(),style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIcon(icon:FontAwesomeIcons.minus,onPressed:()
                            {
                              setState(() {
                               age--;
                              });
                            },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIcon(icon:FontAwesomeIcons.plus,onPressed:()
                            {
                              setState(() {
                                age++;
                              }
                              );
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                )
              ],
              )
              ),
          BottomButton(buttonTittle: 'CALCULATOR',
            onTap:(){
            CalculatorBrain cal =CalculatorBrain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(
              bmiValue: cal.bmiCalculator(),
              resultText: cal.getResult(),
              interprretation: cal.getInterpretation(),
            )));
            },)
        ],
      )

//      floatingActionButton: Theme(
//        data: ThemeData(accentColor: Colors.purple,
//        ),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),
    );
  }
}