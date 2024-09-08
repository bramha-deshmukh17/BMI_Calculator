import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({required this.onPressed, required this.buttonTitle, super.key});

  final VoidCallback onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomButtonColor,
      width: double.infinity,
      height: kBottomButtonHeight,
      margin: const EdgeInsets.only(top: 18.0),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomButtonText,
          ),
        ),
      ),
    );
  }
}


