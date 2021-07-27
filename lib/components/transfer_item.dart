import 'package:bytebank/models/transfer_data.dart';
import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {
  final TransferData data;

  TransferItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('Valor ${data.value.toString()}'),
        subtitle: Text('Conta ${data.accountNumber.toString()}'),
      ),
    );
  }
}
