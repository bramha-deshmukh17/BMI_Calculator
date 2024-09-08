import 'package:bmi_calculator/CardChild.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';
import 'CalculateBMI.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      String resultText = args['resultText'], result = args['result'], info = args['resultInfo'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(
              height: 4.0,
              color: Color(0xFF575656),
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Text(
                  'Your Score',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardChild(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        resultText,
                        style: kResultTitle,
                      ),
                    ),
                    Center(
                      child: Text(
                        result,
                        style: kResult,
                      ),
                    ),
                    Center(
                      child: Text(
                        info,
                        style: kResultInfo,
                      ),
                    ),
                  ],
                ),
                onPress: () {},
              ),
            ),
            BottomButton(onPressed: () {

              Navigator.pop(context);
            },buttonTitle: 'RE-CALCULATE',),
          ],
        ),
      ),
    );
  }
}
