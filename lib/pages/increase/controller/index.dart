import 'package:decimal/decimal.dart';
import 'package:get/get.dart';

class IncreaseController extends GetxController {
  RxString inputValue = '0'.obs;

  change(String input) {
    if (input == '.') {
      var lastChar = inputValue.value[inputValue.value.length - 1];
      if (inputValue.value == '0' || lastChar == '+' || lastChar == '—') {
        input = '0.';
      }
    }

    if (inputValue.value == '0') {
      inputValue.value = '';
    }

    var result = inputValue.value;
    if (input == '+' || input == '—') {
      var lastChar = inputValue.value[inputValue.value.length - 1];
      if (lastChar == '+' || lastChar == '—') {
        result = result.replaceAll(RegExp(r"\+|—"), '');
        print(result);
      } else {
        if (inputValue.value.contains('+')) {
          var arr = inputValue.value.split('+');
          result = (Decimal.parse(arr[0]) + Decimal.parse(arr[1])).toString();
        }
        if (inputValue.value.contains('—')) {
          var arr = inputValue.value.split('—');
          var _t = (Decimal.parse(arr[0]) - Decimal.parse(arr[1])).toDouble();
          _t = _t <= 0 ? 0 : _t;
          result = _t.toString();
        }
      }
    }
    inputValue.value = result + input;
  }

  minus(double value) {
    double _t = double.parse(inputValue.value) - value;
    _t = _t < 0 ? 0 : _t;
    inputValue.value = _t.toString();
  }

  plus(double value) {
    inputValue.value = (double.parse(inputValue.value) + value).toString();
  }

  del() {
    var _arr = inputValue.value.split('');
    _arr.removeLast();
    if (_arr.isEmpty) {
      _arr = ['0'];
    }
    inputValue.value = _arr.join().toString();
  }
}
