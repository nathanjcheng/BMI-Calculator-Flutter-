import 'package:flutter/material.dart';

class reusablecard extends StatelessWidget {

  //constructor we can change the color
  reusablecard({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onPress,
      child: Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
        ),
      ),
    );
  }
}