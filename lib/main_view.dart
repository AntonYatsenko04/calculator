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
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: BlocBuilder<CalcCubit, NumberPair>(
                    builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            numberToDisplay(state.first),
                            style: textTheme.displayMedium,
                          ),
                          Text(
                            numberToDisplay(state.second),
                            style: textTheme.displayMedium,
                          ),
                        ],
                      ),
                      Text(
                        numberToDisplay(state.answer),
                        style: NumberFieldTextStyle,
                      ),
                    ],
                  );
                }),
              ),
              Expanded(flex: 3, child: ButtonPanel()),
            ],
          ),
        ),
      ),
    );
  }

  String numberToDisplay(double num) {
    if (num.isInt()) {
      return num.floor().toString();
    } else {
      return num.toString();
    }
  }
}

extension on double {
  bool isInt() {
    return this.floorToDouble() == this;
  }
}
