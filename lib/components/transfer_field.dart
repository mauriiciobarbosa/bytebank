import 'package:flutter/material.dart';

class TransferField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final String label;
  final String hint;
  final IconData? icon;

  TransferField({
    required this.controller,
    required this.maxLength,
    required this.label,
    required this.hint,
    this.icon,
  });

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
