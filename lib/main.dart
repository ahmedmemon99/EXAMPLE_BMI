import 'package:flutter/material.dart';
import 'imput_page.dart';

void main()
{
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:InputPage(),
    );
  }
}


