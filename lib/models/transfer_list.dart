import 'package:bytebank/models/transfer_data.dart';
import 'package:flutter/material.dart';

class TransferList extends ChangeNotifier {
  List<TransferData> _transferList = [];

  List<TransferData> get list => _transferList;

  void addTransfer(TransferData newTransfer) {
    list.add(newTransfer);
    notifyListeners();
  }
}
