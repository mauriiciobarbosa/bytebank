import 'package:flutter/foundation.dart';

class Amount with ChangeNotifier {
  double _value;

  Amount(this._value) : super();

  void add(double value) {
    _value += value;
    notifyListeners();
  }

  void remove(double value) {
    _value -= value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $_value';
  }
}
