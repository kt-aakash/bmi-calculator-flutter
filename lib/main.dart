import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'Screens/input_page.dart';



void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => InputPage(),
        '/result':(context)=> ResultsPage(bmiResult: null, resultText: null, interptText: null),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0E1020),
        scaffoldBackgroundColor: Color(0xFF0E1020),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



