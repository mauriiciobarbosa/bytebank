import 'package:bytebank/components/transfer_field.dart';
import 'package:bytebank/models/transfer_data.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Criando Transferência';
const _accountNumberLabel = 'Número da Conta';
const _accountNumberHint = '000000';
const _valueLabel = 'Valor';
const _valueHint = '0.00';
const _confirmButtonTitle = 'Confirmar';

class TransferFormScreen extends StatelessWidget {
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransferField(
              controller: accountNumberController,
              maxLength: 6,
              label: _accountNumberLabel,
              hint: _accountNumberHint,
              icon: null,
            ),
            TransferField(
              controller: valueController,
              maxLength: 20,
              label: _valueLabel,
              hint: _valueHint,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _doTransfer(context),
              child: Text(_confirmButtonTitle),
            )
          ],
        ),
      ),
    );
  }

  void _doTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(accountNumberController.text);
    final double? value = double.tryParse(valueController.text);

    if (accountNumber != null && value != null) {
      final newTransfer = TransferData(value, accountNumber);

      Navigator.pop(context, newTransfer);
    }
  }
}
