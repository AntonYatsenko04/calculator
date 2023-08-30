import 'package:flutter/material.dart';
import 'button_panel.dart';
import 'calc_field.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lime,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CalcField(),
                flex: 1,
              ),
              ButtonPanel(),
            ],
          ),
        ),
      ),
    );
  }
//List<Widget>
}
