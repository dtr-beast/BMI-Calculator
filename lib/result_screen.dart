import 'package:bmi_calculator/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class BMIResult extends StatelessWidget {
  final String finalResult, resultStatusText, resultStatus;

  const BMIResult(
      {@required this.finalResult,
      @required this.resultStatusText,
      @required this.resultStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: FlexCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    resultStatus,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  // TODO: Reformat the text alignment here
                  Text(
                    finalResult,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 90.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    resultStatusText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: BottomButton(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(
                  context,
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
