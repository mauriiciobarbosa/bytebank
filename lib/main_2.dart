import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferFormScreen(),
    );
  }
}

class TransferListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // do nothing
        },
      ),
      body: Column(
        children: [
          TransferItem(TransferData(100.00, 101)),
          TransferItem(TransferData(200.00, 102)),
          TransferItem(TransferData(300.00, 103)),
        ],
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final TransferData data;

  TransferItem(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(data.value.toString()),
      subtitle: Text(data.accountNumber.toString()),
    );
  }
}

class TransferData {
  final double value;
  final int accountNumber;

  TransferData(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer(value=$value, accountNumber=$accountNumber)';
  }
}

class TransferFormScreen extends StatelessWidget {
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              controller: accountNumberController,
              style: TextStyle(fontSize: 16),
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '000000',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              controller: valueController,
              style: TextStyle(fontSize: 16),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Valor',
                  hintText: '0.00',
                  icon: Icon(Icons.monetization_on)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? accountNumber =
                  int.tryParse(accountNumberController.text);
              final double? value = double.tryParse(valueController.text);

              if (accountNumber != null && value != null) {
                final newTransfer = TransferData(value, accountNumber);

                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$newTransfer'))
               );
              }
            },
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }
}
