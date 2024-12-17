import 'package:flutter_test/flutter_test.dart';

import 'calculator.dart';

void main() {
  test('i want to test addition', () {
    //step1
    Calculator calc = Calculator();

    //step2
    int result = calc.add(2, 3);

    //step3
    expect(result, 5);
  });
}
