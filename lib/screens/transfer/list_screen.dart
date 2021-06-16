import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/models/transfer_data.dart';
import 'package:bytebank/screens/transfer/form_screen.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Tranferências';

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
        title: Text(_titleAppBar),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferFormScreen();
          })).then((newTransfer) {
            if (newTransfer != null) {
              setState(() => widget._entries.add(newTransfer));
            }
          });
        },
      ),
    );
  }
}
