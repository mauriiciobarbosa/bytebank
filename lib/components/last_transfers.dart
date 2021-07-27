import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/models/transfer_list.dart';
import 'package:bytebank/screens/transfer/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Últimas transferências',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Consumer<TransferList>(
          builder: (context, transfers, child) {
            final transfersList = transfers.sortedList();
            return ListView.builder(
              shrinkWrap: true,
              itemCount: transfersList.length > 2 ? 2 : transfersList.length,
              itemBuilder: (context, position) {
                return TransferItem(transfers.sortedList()[position]);
              },
            );
          },
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
    );
  }
}
