import 'package:bytebank/models/transfer_data.dart';
import 'package:flutter/material.dart';

class TransferList extends ChangeNotifier {
  List<TransferData> _transferList = [];

  List<TransferData> get list => _transferList;

  void addTransfer(TransferData newTransfer) {
    _transferList.add(newTransfer);
    notifyListeners();
  }

  List<TransferData> sortedList() {
    final List<TransferData> list = List.from(_transferList, growable: false);

    list.sort((a, b) => b.order.compareTo(a.order));

    return list;
  }
}
