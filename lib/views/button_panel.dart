import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calclator/state/calc_cubit.dart';
import 'package:calclator/state/number_pair.dart';
import 'package:calclator/views/style.dart';

class ButtonPanel extends StatelessWidget {
  const ButtonPanel({super.key});

  static const rowMainAxisAlignment = MainAxisAlignment.center;
  static const rowCrossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<CalcCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: rowMainAxisAlignment,
          children: [
            buttonFactory(context, buttonText: '%', onPressed: () {
              state.setOperation(Operation.mod);
            }),
            buttonFactory(context, buttonText: 'C', onPressed: () {
              state.clear();
            }),
            buttonFactory(context,
                buttonContent: const Icon(
                  Icons.backspace_rounded,
                  size: MediumTextSize,
                  color: Colors.black,
                ), onPressed: () {
              state.deleteAnswer();
            }),
            buttonFactory(context, buttonText: '/', onPressed: () {
              state.setOperation(Operation.divide);
            }),
          ],
        ),
        Row(
          mainAxisAlignment: rowMainAxisAlignment,
          children: [
            buttonFactory(context, buttonText: '7', onPressed: () {
              state.addNumber(7);
            }),
            buttonFactory(context, buttonText: '8', onPressed: () {
              state.addNumber(8);
            }),
            buttonFactory(context, buttonText: '9', onPressed: () {
              state.addNumber(9);
            }),
            buttonFactory(context, buttonText: 'X', onPressed: () {
              state.setOperation(Operation.multiply);
            }),
          ],
        ),
        Row(
          mainAxisAlignment: rowMainAxisAlignment,
          children: [
            buttonFactory(context, buttonText: '4', onPressed: () {
              state.addNumber(4);
            }),
            buttonFactory(context, buttonText: '5', onPressed: () {
              state.addNumber(5);
            }),
            buttonFactory(context, buttonText: '6', onPressed: () {
              state.addNumber(6);
            }),
            buttonFactory(context, buttonText: '—', onPressed: () {
              state.setOperation(Operation.subtract);
            }),
          ],
        ),
        Row(
          mainAxisAlignment: rowMainAxisAlignment,
          children: [
            buttonFactory(context, buttonText: '1', onPressed: () {
              state.addNumber(1);
            }),
            buttonFactory(context, buttonText: '2', onPressed: () {
              state.addNumber(2);
            }),
            buttonFactory(context, buttonText: '3', onPressed: () {
              state.addNumber(3);
            }),
            buttonFactory(context, buttonText: '+', onPressed: () {
              state.setOperation(Operation.add);
            }),
          ],
        ),
        Row(
          mainAxisAlignment: rowMainAxisAlignment,
          children: [
            buttonFactory(context,
                buttonContent: Image.asset(
                  'assets/icons/plus-minus.png',
                  scale: 80,
                ), onPressed: () {
              state.changeNegation();
            }),
            buttonFactory(context, buttonText: '0', onPressed: () {
              state.addNumber(0);
            }),
            buttonFactory(context, buttonText: ',', onPressed: () {
              state.setDouble();
            }),
            buttonFactory(context, buttonText: '=', onPressed: () {
              state.setCalculation();
            }),
          ],
        ),
      ],
    );
  }

  Widget buttonFactory(BuildContext context,
      {required Function() onPressed,
      String? buttonText,
      Widget? buttonContent}) {
    if (buttonText == null && buttonContent == null) {
      buttonText = 'default';
    }
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(deviceWidth / 150),
      child: Container(
        constraints: BoxConstraints.tight(
            Size.fromRadius(min(deviceWidth / 8.85, deviceHeight / 8.85))),
        child: ElevatedButton(
          style: CalcButtonStyle,
          onPressed: onPressed,
          child: buttonContent ??
              Text(
                buttonText!,
                style: ButtonTextStyle,
              ),
        ),
      ),
    );
  }
}
