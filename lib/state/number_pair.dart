import 'package:equatable/equatable.dart';

enum Operation {
  add,
  subtract,
  multiply,
  divide,
  mod,
  none;
}

class NumberPair extends Equatable {
  final double first;
  final double second;
  final double answer;
  final bool isDouble;
  final Operation operation;

  const NumberPair(
    this.first,
    this.second,
    this.answer,
    this.isDouble,
    this.operation,
  );

  @override
  List<Object> get props {
    return [
      first,
      second,
      answer,
      isDouble,
      operation,
    ];
  }

  NumberPair copyWith({
    double? first,
    double? second,
    double? answer,
    bool? isDouble,
    Operation? operation,
  }) {
    return NumberPair(
      first ?? this.first,
      second ?? this.second,
      answer ?? this.answer,
      isDouble ?? this.isDouble,
      operation ?? this.operation,
    );
  }
}
