import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ReusableCardData.dart';
import 'Gesture_page.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmi,
      @required this.interpretation,
      @required this.advice});
  final String interpretation;
  final String advice;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: Text(
                    'Your Results',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    interpretation,
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    advice,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
            MyGesture(
                text: 'RE-CALCULATE',
                ontap: () {
                  Navigator.pop(context);
                })
          ],
        ));
  }
}
