import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'Gesture_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'Icon_content.dart';
import 'ReusableCardData.dart';
import 'result_page.dart';
import 'Calculation.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum HumnanType {
  male,
  female,
}
HumnanType gender;
int height = 180;
int weight = 60;
int age = 15;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        gender = HumnanType.male;
                      });
                    },
                    colour: gender == HumnanType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: ReuseChildCard(
                      human: FontAwesomeIcons.male,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onpress: () {
                    setState(() {
                      gender = HumnanType.female;
                    });
                  },
                  colour: gender == HumnanType.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childCard: ReuseChildCard(
                    human: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: Klabel,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: KNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: Klabel,
                        )
                      ],
                    ),
                    SliderTheme(
                        data: SliderThemeData(
                            trackHeight: 0.5,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 13,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.00,
                            max: 220.00,
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            })),
                  ],
                ),
              ))
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: Klabel,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        weight.toString(),
                        style: KNumberStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LowerIcons(
                              myicon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          SizedBox(
                            width: 30,
                          ),
                          LowerIcons(
                            myicon: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: Klabel,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        age.toString(),
                        style: KNumberStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LowerIcons(
                              myicon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 30,
                          ),
                          LowerIcons(
                            myicon: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          MyGesture(
            text: 'CALCULATE',
            ontap: () {
              CalculateBrain cal =
                  CalculateBrain(height: height, weight: weight);
              print(height);
              print(weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                          bmi: cal.bMI(),
                          interpretation: cal.result(),
                          advice: cal.advice(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
