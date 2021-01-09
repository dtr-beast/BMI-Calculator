import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      inactiveColor: Color(0xFF8D8E98),
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
                  child: FlexCard(),
                ),
                Expanded(
                  child: FlexCard(),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFFF00FF),
            width: double.infinity,
            height: 45.0,
          )
        ],
      ),
    );
  }
}
