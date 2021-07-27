import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/models/transfer_list.dart';
import 'package:bytebank/screens/transfer/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Tranferências';

class TransferListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Consumer<TransferList>(
        builder: (BuildContext context, transfers, Widget? child) {
          return ListView.builder(
            itemCount: transfers.list.length,
            itemBuilder: (context, index) {
              return TransferItem(transfers.list[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferFormScreen();
          }));
        },
      ),
    );
  }
}
