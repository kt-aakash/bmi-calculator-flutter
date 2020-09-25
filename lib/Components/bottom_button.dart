import 'package:bmi_calculator/Components/size_config.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: SizeConfig.screenHeight*0.1,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
        ),
      ),
    );
  }
}
