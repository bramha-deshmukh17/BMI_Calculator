import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CardChild.dart';
import 'ChildCardGender.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('BMI Calculator')),
              backgroundColor: const Color(0xFF0A0E21),
            ),
            body: Column(
              children: [
                const Expanded(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: CardChild(
                        colour: Color(0xFF1D1E33),
                        cardChild: ChildCardGender(gender: FontAwesomeIcons.mars,genderText: 'MALE',),
                      )),
                      Expanded(
                          child: CardChild(
                        colour: Color(0xFF1D1E33),
                        cardChild:ChildCardGender(gender:FontAwesomeIcons.venus,genderText: 'FEMALE',),
                      )),
                    ],
                  ),
                ),
                const Expanded(
                    child: CardChild(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.mars,
                      size: 80.0,),
                      Text('Male')
                    ],
                  ),
                )),
                const Expanded(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CardChild(
                          colour: Color(0xFF1D1E33),
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.mars),
                              Text('Male')
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: CardChild(
                        colour: Color(0xFF1D1E33),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.mars),
                            Text('Male')
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  color: Colors.pink,
                  width: double.infinity,
                  height: 80.0,
                  margin: EdgeInsets.only(top: 18.0),
                ),
              ],
            )));
  }
}
