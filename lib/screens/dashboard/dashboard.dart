import 'package:bytebank/components/available_amount.dart';
import 'package:bytebank/screens/deposit/Deposit.dart';
import 'package:bytebank/screens/transfer/form_screen.dart';
import 'package:bytebank/screens/transfer/list_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AvailableAmount(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Deposit();
                      },
                    ));
                  },
                  child: Text('Depósito'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TransferFormScreen();
                      },
                    ));
                  },
                  child: Text('Nova Transferência'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return TransferListScreen();
                  },
                ));
              },
              child: Text('Transferências'),
            ),
          )
        ],
      ),
    );
  }
}
