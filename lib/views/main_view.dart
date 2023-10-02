import 'package:calclator/number_pair.dart';
import 'package:calclator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calclator/calc_cubit.dart';
import 'package:calclator/button_panel.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CalcCubit, NumberPair>(builder: (context, state) {
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              numberToDisplay(state.first),
                              style: secondaryNumberFieldTextStyle,
                            ),
                            Text(
                              operationSymbol(state),
                              style: secondaryNumberFieldTextStyle,
                            ),
                            Text(
                              numberToDisplay(state.second),
                              style: secondaryNumberFieldTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              answerToDisplay(state.answer),
                              style: NumberFieldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonPanel(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String numberToDisplay(double num) {
    if (num == 0) {
      return '';
    } else {
      return answerToDisplay(num);
    }
  }

  String answerToDisplay(double num) {
    if (num.isInt()) {
      return num.floor().toString();
    } else {
      return num.toString();
    }
  }

  String operationSymbol(NumberPair state) {
    if (state.first == 0) return '';
    String symbol;
    switch (state.operation) {
      case Operation.add:
        {
          symbol = '+';
        }
      case Operation.subtract:
        {
          symbol = '-';
        }
      case Operation.divide:
        {
          symbol = '/';
        }
      case Operation.multiply:
        {
          symbol = '×';
        }
      case Operation.mod:
        {
          symbol = '%';
        }
      case Operation.none:
        {
          symbol = '';
        }
    }
    return symbol;
  }
}

extension on double {
  bool isInt() {
    return this.floorToDouble() == this;
  }
}
