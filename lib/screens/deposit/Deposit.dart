import 'package:bytebank/components/transfer_field.dart';
import 'package:bytebank/models/amount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Deposit extends StatelessWidget {
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depósito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransferField(
              controller: valueController,
              maxLength: 20,
              label: 'Valor',
              hint: '0.00',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _doTransfer(context),
              child: Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  _doTransfer(BuildContext context) {
    final value = double.tryParse(valueController.text);

    if (value != null) {
      Provider.of<Amount>(context, listen: false).add(value);

      Navigator.pop(context);
    }
  }
}
