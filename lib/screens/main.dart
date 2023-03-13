import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme:AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        colorScheme:  Theme.of(context).colorScheme.copyWith(secondary: Colors.purple),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}

