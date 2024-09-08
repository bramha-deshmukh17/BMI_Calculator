import 'package:flutter/material.dart';
import 'constants.dart';

class ChildCardGender extends StatelessWidget {
  const ChildCardGender({required this.gender, required this.genderText, super.key,  });

  final IconData gender;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(gender,
          size: 80.0,),
        Text(genderText,
          style: kLabelText),
      ],
    );
  }
}
