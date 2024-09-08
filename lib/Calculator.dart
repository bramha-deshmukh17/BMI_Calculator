import 'package:bmi_calculator/CalculateBMI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CardChild.dart';
import 'ChildCardGender.dart';
import 'constants.dart';
import 'BottomButton.dart';

enum Gender { male, female }

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Gender? selectedGender;
  int selectedHeight = 120;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI Calculator')),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CardChild(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const ChildCardGender(
                        gender: FontAwesomeIcons.mars,
                        genderText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardChild(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const ChildCardGender(
                        gender: FontAwesomeIcons.venus,
                        genderText: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardChild(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: kLabelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          selectedHeight.toString(),
                          style: kInfoText,
                        ),
                        const Text(
                          ' cm',
                          style: kLabelText,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        thumbColor: kBottomButtonColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: selectedHeight.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (double value) {
                          setState(() {
                            selectedHeight = value.toInt();
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
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CardChild(
                      onPress: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: kLabelText,
                          ),
                          Text(
                            weight.toString(),
                            style: kInfoText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButton(
                                btnIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight > 0 ? weight-- : 0;
                                  });
                                },
                              ),
                              RoundButton(
                                btnIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardChild(
                      onPress: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: kLabelText,
                          ),
                          Text(
                            age.toString(),
                            style: kInfoText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButton(
                                btnIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age > 0 ? age-- : 0;
                                  });
                                },
                              ),
                              RoundButton(
                                btnIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age < 101 ? age++ : 100;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPressed: () {
                CalculateBMI cal = CalculateBMI(weight: weight, height: selectedHeight);
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'result': cal.Calculate(),
                    'resultText': cal.getText(),
                    'resultInfo': cal.getInfo()
                  },
                );
              },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}

//plus minus buttons
class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key, required this.btnIcon, required this.onPressed});

  final IconData btnIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 8.0,
      constraints: const BoxConstraints.tightFor(
        height: 55.0,
        width: 55.0,
      ),
      shape: CircleBorder(),
      fillColor: kActionButton,
      child: Icon(btnIcon),
    );
  }
}
