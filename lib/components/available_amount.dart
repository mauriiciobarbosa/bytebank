import 'package:bytebank/models/amount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvailableAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Amount>(builder: (context, value, child) {
          return Text(
            value.toString(),
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          );
        }),
      ),
    );
  }
}
