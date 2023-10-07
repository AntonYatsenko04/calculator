import 'package:bloc/bloc.dart';
import 'number_pair.dart';

class OperationNotChosenException implements Exception {
  OperationNotChosenException();
}

class CalcCubit extends Cubit<NumberPair> {
  CalcCubit() : super(const NumberPair(0, 0, 0, false, Operation.none));

  double maxAnswer = double.maxFinite;

  void setDouble() {
    if (state.isDouble) return;
    emit(state.copyWith(isDouble: true));
  }

  void addNumber(int num) {
    if (num > 9 || num < 0) return;
    if (state.first != 0) {
      emit(state.copyWith(
          first: 0,
          second: 0,
          answer: 0,
          isDouble: false,
          operation: Operation.none));
    }
    double answer;
    if (state.isDouble) {
      if (state.answer.floorToDouble() == state.answer) {
        answer = double.parse(
            '${state.answer.floor().toString()}.${num.toString()}');
      } else {
        answer = double.parse(state.answer.toString() + num.toString());
      }
    } else {
      answer = state.answer * 10 + num;
    }
    if (answer > maxAnswer) return;
    emit(state.copyWith(answer: answer));
  }

  void setCalculation() {
    double answer;
    try {
      if (state.first != 0) {
        answer = calculate(state.answer, state.second);
        emit(state.copyWith(first: state.answer, answer: answer));
        return;
      }
      answer = calculate(state.second, state.answer);
    } catch (e) {
      answer = state.answer;
      return;
    }
    emit(state.copyWith(
      first: state.second,
      second: state.answer,
      answer: answer,
    ));
  }

  double calculate(double first, double second) {
    double answer;
    switch (state.operation) {
      case Operation.add:
        {
          answer = first + second;
        }
      case Operation.subtract:
        {
          answer = first - second;
        }
      case Operation.divide:
        {
          answer = first / second;
        }
      case Operation.multiply:
        {
          answer = first * second;
        }
      case Operation.mod:
        {
          answer = first % second;
        }
      case Operation.none:
        {
          throw OperationNotChosenException();
        }
    }
    if (answer > maxAnswer) return state.answer;
    return answer;
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
    double answer;
    try {
      if (state.first != 0) {
        answer = state.answer;
      } else {
        answer = calculate(state.second, state.answer);
      }
    } catch (e) {
      answer = state.answer;
    }
    emit(state.copyWith(
        first: 0,
        second: answer,
        answer: 0,
        isDouble: false,
        operation: operation));
  }
}
