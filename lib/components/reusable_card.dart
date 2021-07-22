import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.onPress,this.colour, this.cardChild);
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPress(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
