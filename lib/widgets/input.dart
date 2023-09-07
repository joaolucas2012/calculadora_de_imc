import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String text;

  const Input({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          label: Text(
        text,
        style: const TextStyle(
          color: Colors.green,
        ),
      )),
    );
  }
}
