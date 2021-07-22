import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/constants.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/round_icon_button.dart';
import 'package:bmi/caulator_brain.dart';
import 'dart:math';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  double height = 1.5;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  IconContent(FontAwesomeIcons.mars, 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              () {},
              kActiveCardColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'AGE',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: age.toDouble(),
                      min: 0.0,
                      max: 100.0,
                      activeColor: Color(0xFFEB1555),
                      // inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          age = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    () {},
                    kActiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    () {},
                    kActiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          height.toStringAsFixed(1),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                height -= 0.1;
                           
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                  height += 0.1;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(() {
            CaculatorBrain calc = CaculatorBrain(weight, height);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(calc.getInteroretation(),
                      calc.calulateBMI(), calc.getResult())),
            );
          }, 'CALULATE')
        ],
      ),
    );
  }
}
