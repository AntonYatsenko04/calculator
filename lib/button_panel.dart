import 'package:flutter/material.dart';
import 'style.dart';
import 'calc_field.dart';

class ButtonPanel extends StatelessWidget {
  const ButtonPanel({super.key});

  static const rowMainAxisAlignment = MainAxisAlignment.start;
  static const rowCrossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          fifthRow(),
          fourthRow(),
          thirdRow(),
          secondRow(),
          firstRow(),
        ],
      ),
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
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(20.0),
                ),
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
      ),
    );
  }

  Widget firstRow() {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: rowCrossAxisAlignment,
      children: [
        buttonFactory(buttonText: '0', onPressed: () => {}),
        buttonFactory(buttonText: ',', onPressed: () {}),
        buttonFactory(buttonText: '=', onPressed: () {}),
        buttonFactory(buttonText: '+/-', onPressed: () {}),
      ],
    );
  }

  Widget secondRow() {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: rowCrossAxisAlignment,
      children: [
        buttonFactory(buttonText: '1', onPressed: () {}),
        buttonFactory(buttonText: '2', onPressed: () {}),
        buttonFactory(buttonText: '3', onPressed: () {}),
        buttonFactory(buttonText: '+', onPressed: () {}),
      ],
    );
  }

  Widget thirdRow() {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: rowCrossAxisAlignment,
      children: [
        buttonFactory(buttonText: '4', onPressed: () {}),
        buttonFactory(buttonText: '5', onPressed: () {}),
        buttonFactory(buttonText: '6', onPressed: () {}),
        buttonFactory(buttonText: '-', onPressed: () {}),
      ],
    );
  }

  Widget fourthRow() {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: rowCrossAxisAlignment,
      children: [
        buttonFactory(buttonText: '7', onPressed: () {}),
        buttonFactory(buttonText: '8', onPressed: () {}),
        buttonFactory(buttonText: '9', onPressed: () {}),
        buttonFactory(buttonText: 'X', onPressed: () {}),
      ],
    );
  }

  Widget fifthRow() {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: rowCrossAxisAlignment,
      children: [
        buttonFactory(buttonText: '/', onPressed: () {}),
        buttonFactory(buttonText: 'С', onPressed: () {}),
        buttonFactory(buttonText: '%', onPressed: () {}),
        buttonFactory(
            buttonContent: const Icon(
              Icons.backspace,
              size: MediumTextSize,
            ),
            onPressed: () {}),
      ],
    );
  }
}
