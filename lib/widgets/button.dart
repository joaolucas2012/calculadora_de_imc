import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Function? calculate;

  const Button({
    Key? key,
    required this.title,
    this.calculate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => (calculate != null) ? calculate!() : null,
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  (calculate != null) ? Colors.purple : Colors.grey,
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
