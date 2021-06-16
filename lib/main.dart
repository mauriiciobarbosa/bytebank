import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferListScreen(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700],
          ),
        ),
      ),
    );
  }
}

class TransferListScreen extends StatefulWidget {
  final List<TransferData> _entries = [];

  @override
  State<StatefulWidget> createState() => TransferListScreenState();
}

class TransferListScreenState extends State<TransferListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranferências'),
      ),
      body: ListView.builder(
        itemCount: widget._entries.length,
        itemBuilder: (context, index) {
          return TransferItem(widget._entries[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<TransferData?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferFormScreen();
          }));
          // do nothing

          future.then((newTransfer) {
            if (newTransfer != null) {
              setState(() {
                widget._entries.add(newTransfer);
              });
            }
          });
        },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransferField(
              controller: accountNumberController,
              maxLength: 6,
              label: 'Número da Conta',
              hint: '000000',
              icon: null,
            ),
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

  void _doTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(accountNumberController.text);
    final double? value = double.tryParse(valueController.text);

    if (accountNumber != null && value != null) {
      final newTransfer = TransferData(value, accountNumber);

      Navigator.pop(context, newTransfer);
    }
  }
}

class TransferField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final String label;
  final String hint;
  final IconData? icon;

  TransferField(
      {required this.controller,
      required this.maxLength,
      required this.label,
      required this.hint,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          icon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
