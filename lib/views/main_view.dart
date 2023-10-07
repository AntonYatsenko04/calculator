import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/calc_cubit.dart';
import '../state/number_pair.dart';
import 'button_panel.dart';
import 'style.dart';

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
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '${numberToDisplay(state.first)} ${operationSymbol(state)} ${numberToDisplay(state.second)}',
                                    style: secondaryNumberFieldTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    answerToDisplay(state.answer),
                                    style: NumberFieldTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ButtonPanel(),
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
    return floorToDouble() == this;
  }
}
