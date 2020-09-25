import 'package:bmi_calculator/Components/size_config.dart';
import 'package:flutter/material.dart';


const kBottomContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);
const double kMinHeight = 120.0;
const double kMaxHeight = 220.0;
const kSliderActivColor = Colors.white;
const kSliderInActivColor = Colors.white;


const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);


final kLabelNumberStyle = TextStyle(
  fontSize: SizeConfig.screenHeight*0.05,
  fontWeight: FontWeight.w900,
);


final kTitleTextStyle = TextStyle(
  fontSize: SizeConfig.screenHeight*0.05,
  fontWeight: FontWeight.bold,
);


const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
    fontSize: 22.0,
  fontWeight: FontWeight.bold,
);


final kBMITextStyle = TextStyle(
  fontSize: SizeConfig.screenHeight*0.1,
  fontWeight: FontWeight.bold,
);

const kBMIBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
