import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    colour: selectedGender == Gender.MALE
                        ? kActiveColour
                        : kInactiveColour,
                    cardChild: IconContent(
                      label: 'MALE',
                      iconData: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    cardChild: IconContent(
                      label: "FEMALE",
                      iconData: FontAwesomeIcons.venus,
                    ),
                    colour: selectedGender == Gender.FEMALE
                        ? kActiveColour
                        : kInactiveColour,
                  ),
                ),
              ]),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1.0,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kGreyColor,
                        thumbColor: kRedColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: kTransparentRedColor,
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          }),
                    ),
                  ],
                ),
                colour: kActiveColour,
              ),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight != 0) weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age != 0) age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ])
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            BottomButton(
              buttonTitle: 'CALLCULATE',
              onTap: () {
                CalculatorBrain calculator =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calculator.calculateBMI(),
                      resultText: calculator.getResult(),
                      interpretation: calculator.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
