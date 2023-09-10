import 'package:bloc/bloc.dart';
import 'package:calclator/number_pair.dart';

class CalcCubit extends Cubit<NumberPair> {
  CalcCubit() : super(const NumberPair(0, 0, 0, false, Operation.none));

  void setDouble() {
    if (state.isDouble) return;
    emit(state.copyWith(isDouble: true));
  }

  void addNumber(int num) {
    if (num > 9 || num < 0) return;
    if (state.isDouble) {
      emit(state.copyWith(
          answer: double.parse(state.answer.toString() + num.toString())));
    } else {
      emit(state.copyWith(answer: state.answer * 10 + num));
    }
  }

  void calculate() {
    double answer;
    switch (state.operation) {
      case Operation.add:
        {
          answer = state.second + state.answer;
        }
      case Operation.subtract:
        {
          answer = state.second - state.answer;
        }
      case Operation.divide:
        {
          answer = state.second / state.answer;
        }
      case Operation.multiply:
        {
          answer = state.second * state.answer;
        }
      case Operation.mod:
        {
          answer = state.second % state.answer;
        }
      case Operation.none:
        {
          return;
        }
    }
    emit(state.copyWith(
        first: state.second, second: state.answer, answer: answer));
  }

  void changeNegation() {
    emit(state.copyWith(answer: -state.answer));
  }

  void deleteAnswer() {
    emit(state.copyWith(answer: 0));
  }

  void clear() {
    emit(const NumberPair(0, 0, 0, false, Operation.none));
  }

  void setOperation(Operation operation) {
    emit(state.copyWith(
        first: state.second,
        second: state.answer,
        answer: 0,
        operation: operation));
  }
}