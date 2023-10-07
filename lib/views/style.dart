import 'package:flutter/material.dart';

const String FontNameDefault = 'Varela Round';
const SmallTextSize = 35.0;
const MediumTextSize = 40.0;
const LargeTextSize = 70.0;

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
  shape: const CircleBorder(),
  padding: const EdgeInsets.all(20.0),
);

final secondaryNumberFieldTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: SmallTextSize,
  color: Colors.black.withOpacity(0.5),
);
