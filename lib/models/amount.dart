import 'package:flutter/foundation.dart';

class Amount with ChangeNotifier {
  double _value;

  Amount(this._value) : super();


  double get value => _value;

  void add(double value) {
    _value += value;
    notifyListeners();
  }

  bool remove(double value) {
    if (_value < value) return false;

    _value -= value;
    notifyListeners();

    return true;
  }

  @override
  String toString() {
    return 'R\$ $_value';
  }
}
