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
                      Text(
                        state.first.toString(),
                        style: textTheme.displayMedium,
                      ),
                      Text(
                        state.second.toString(),
                        style: textTheme.displayMedium,
                      ),
                      Text(
                        state.answer.toString(),
                        style: NumberFieldTextStyle,
                      ),
                    ],
                  );
                }),
              ),
              ButtonPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
