import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function setButtonToVisible;

  const Input({
    Key? key,
    required this.text,
    required this.controller,
    required this.setButtonToVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Colors.purple),
        alignLabelWithHint: true,
        errorStyle: const TextStyle(color: Colors.red),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.purple),
      onChanged: (value) => setButtonToVisible(),
    );
  }
}
