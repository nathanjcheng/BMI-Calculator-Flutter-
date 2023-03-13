import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/constants.dart';
import '../components/results_page.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculatorBrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  //this is mutable
  Color maleCardColour = dumbCard;
  Color femaleCardColour = dumbCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: reusablecard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                    colour: selectedGender == Gender.male ? cardColors : dumbCard,
                    cardChild: iconCard(icon: FontAwesomeIcons.mars,label: 'MALE')),
                ),
                Expanded(child: reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? cardColors : dumbCard,
                    cardChild: iconCard(icon: FontAwesomeIcons.venus, label: 'FEMALE')
                ),),
              ],
            )),
            Expanded(child: reusablecard(
                colour: cardColors,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text('HEIGHT', style: labelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kbold,),
                        Text('cm', style: labelTextStyle,),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 270.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
            ),),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: reusablecard(
                    colour: cardColors,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kbold,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              functionality: () {
                                setState(() {
                                  weight--;
                                });
                              }
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                                functionality: () {
                                  setState(() {
                                    weight++;
                                  });
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: reusablecard(
                    colour: cardColors,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kbold,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              functionality: () {
                                setState(() {
                                  age--;
                                });
                              }
                          ),
                          SizedBox(width: 10,),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              functionality: () {
                                setState(() {
                                  age++;
                                });
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),),
              ],
            )),
            BottomButton(buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),),);
            }),
          ],
        ),
      );
    }
  }

