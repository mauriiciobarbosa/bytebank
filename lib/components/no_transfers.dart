import 'package:flutter/material.dart';

class NoTransfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            'Você ainda não têm nenhuma transferência cadastrada.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
