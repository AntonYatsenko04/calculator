import 'package:calclator/calc_cubit.dart';
import 'package:calclator/number_pair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'style.dart';

class ButtonPanel extends StatelessWidget {
  const ButtonPanel({super.key});

  static const rowMainAxisAlignment = MainAxisAlignment.start;
  static const rowCrossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<CalcCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            buttonFactory(
                buttonText: '%',
                onPressed: () {
                  state.setOperation(Operation.mod);
                }),
            buttonFactory(
                buttonText: 'С',
                onPressed: () {
                  state.clear();
                }),
            buttonFactory(
                buttonContent: const Icon(
                  Icons.backspace_sharp,
                  size: MediumTextSize,
                  color: Colors.black,
                ),
                onPressed: () {
                  state.deleteAnswer();
                }),
            buttonFactory(
                buttonText: '/',
                onPressed: () {
                  state.setOperation(Operation.divide);
                }),
          ],
        ),
        Row(
          children: [
            buttonFactory(
                buttonText: '7',
                onPressed: () {
                  state.addNumber(7);
                }),
            buttonFactory(
                buttonText: '8',
                onPressed: () {
                  state.addNumber(8);
                }),
            buttonFactory(
                buttonText: '9',
                onPressed: () {
                  state.addNumber(9);
                }),
            buttonFactory(
                buttonText: 'X',
                onPressed: () {
                  state.setOperation(Operation.multiply);
                }),
          ],
        ),
        Row(
          children: [
            buttonFactory(
                buttonText: '4',
                onPressed: () {
                  state.addNumber(4);
                }),
            buttonFactory(
                buttonText: '5',
                onPressed: () {
                  state.addNumber(5);
                }),
            buttonFactory(
                buttonText: '6',
                onPressed: () {
                  state.addNumber(6);
                }),
            buttonFactory(
                buttonText: '-',
                onPressed: () {
                  state.setOperation(Operation.subtract);
                }),
          ],
        ),
        Row(
          children: [
            buttonFactory(
                buttonText: '1',
                onPressed: () {
                  state.addNumber(1);
                }),
            buttonFactory(
                buttonText: '2',
                onPressed: () {
                  state.addNumber(2);
                }),
            buttonFactory(
                buttonText: '3',
                onPressed: () {
                  state.addNumber(3);
                }),
            buttonFactory(
                buttonText: '+',
                onPressed: () {
                  state.setOperation(Operation.add);
                }),
          ],
        ),
        Row(
          children: [
            buttonFactory(
                buttonText: '+/-',
                onPressed: () {
                  state.changeNegation();
                }),
            buttonFactory(
                buttonText: '0',
                onPressed: () {
                  state.addNumber(0);
                }),
            buttonFactory(
                buttonText: ',',
                onPressed: () {
                  state.setDouble();
                }),
            buttonFactory(
                buttonText: '=',
                onPressed: () {
                  state.calculate();
                }),
          ],
        ),
      ],
    );
  }

  Widget buttonFactory(
      {required Function() onPressed,
      String? buttonText,
      Widget? buttonContent}) {
    if (buttonText == null && buttonContent == null) {
      buttonText = 'default';
    }
    return Center(
      child: IntrinsicWidth(
        stepHeight: 50,
        stepWidth: 50,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
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
        ),
      ),
    );
  }
}
