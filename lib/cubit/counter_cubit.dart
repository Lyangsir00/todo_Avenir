import 'package:bloc/bloc.dart';

class CubitCounter extends Cubit<int> {
  CubitCounter() : super(0);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state == 0) {
      return;
    }
    emit(state - 1);
  }
}
