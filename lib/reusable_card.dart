import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget ?cardChild;
  //following worked well
  //final void Function() onPress;
  final void Function()?  pressedMe;

  ReusableCard({required this.colour,  this.cardChild,this.pressedMe});
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressedMe,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: colour,
        ),
      ),
    );
  }
}
