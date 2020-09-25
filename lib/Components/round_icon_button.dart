import 'package:flutter/material.dart';
import '../constants.dart';

class RoundActionButton extends StatelessWidget {
  final IconData icon;
  final Function functionality;
  RoundActionButton({@required this.icon, this.functionality});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      child: Icon(icon),
      onPressed: functionality,
    );
  }
}
