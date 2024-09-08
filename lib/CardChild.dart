import 'dart:ffi';

import 'package:flutter/material.dart';

class CardChild extends StatelessWidget {
  const CardChild({required this.colour, required this.cardChild, required this.onPress, super.key});
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: cardChild,
      ),
    );
  }
}
