import 'package:flutter/material.dart';

const String FontNameDefault = 'Starlight';
const MediumTextSize = 40.0;
const LargeTextSize = 40.0;

const ButtonTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w600,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const NumberFieldTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w600,
  fontSize: LargeTextSize,
  color: Colors.black,
);

final CalcButtonStyle = ElevatedButton.styleFrom(
  textStyle: ButtonTextStyle,
  backgroundColor: Colors.red[400],
  shape: CircleBorder(),
  padding: const EdgeInsets.all(20.0),
);
