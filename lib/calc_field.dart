import 'package:flutter/material.dart';
import 'button_panel.dart';

class CalcField extends StatefulWidget {
  const CalcField({super.key});

  @override
  State<CalcField> createState() => _CalcFieldState();
}

class _CalcFieldState extends State<CalcField> {
  final _controller = TextEditingController();
  void changeValue() {
    _controller.value = TextEditingValue(text: "asda");
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller, readOnly: true);
  }
}
