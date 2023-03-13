import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.functionality});
  final IconData icon;
  final Function functionality;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        functionality();
      },
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xDD4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
    );
  }
}