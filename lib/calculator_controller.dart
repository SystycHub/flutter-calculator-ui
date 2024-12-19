import 'calculator_model.dart';

class CalculatorController {
  final Calculator _calculator = Calculator();

  double? result;

  void calculate(String operation, double num1, double num2) {
    switch (operation) {
      case '+':
        result = _calculator.add(num1, num2);
        break;
      case '-':
        result = _calculator.subtract(num1, num2);
        break;
      case '*':
        result = _calculator.multiply(num1, num2);
        break;
      case '/':
        result = _calculator.divide(num1, num2);
        break;
      default:
        throw ArgumentError("Invalid operation");
    }
  }
}
