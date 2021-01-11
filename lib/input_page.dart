import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_calculate.dart';
import 'constants.dart';
import 'custom_widgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender currentGender;
  int currentHeight = 180;
  int currentWeight = 60;
  int currentAge = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: FlexCard(
                      colour: currentGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardChildIcon(
                        cardText: 'MALE',
                        cardIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentGender =
                            (currentGender == Gender.male ? null : Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: FlexCard(
                      colour: currentGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardChildIcon(
                        cardText: 'FEMALE',
                        cardIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentGender = (currentGender == Gender.female
                            ? null
                            : Gender.female);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlexCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBD8E98),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        currentHeight.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'CM',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      onChanged: (double givenHeight) {
                        setState(() {
                          currentHeight = givenHeight.toInt();
                        });
                      },
                      value: currentHeight.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      activeColor: Color(0xFFEB1555),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: FlexCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          currentWeight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  currentWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  currentWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FlexCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          currentAge.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  currentAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  currentAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: BottomButton(
              text: 'CALCULATE',
              onTap: () {
                BMICalculate BMIDetails = BMICalculate(
                    height: currentHeight,
                    weight: currentWeight,
                    age: currentAge);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResult(
                      finalResult: BMIDetails.calculateBMI(),
                      resultStatus: BMIDetails.getBMIStatus(),
                      resultStatusText: BMIDetails.getBMIStatusText(),
                    ),
                  ),
                );
              },
            ),
            color: Colors.pinkAccent,
            width: double.infinity,
            height: 45.0,
            padding: EdgeInsets.only(bottom: 10.0),
            margin: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );
  }
}
