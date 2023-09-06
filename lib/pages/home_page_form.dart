import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/input.dart';

class HomePageForm extends StatefulWidget {
  const HomePageForm({super.key});

  @override
  State<HomePageForm> createState() => _HomePageFormState();
}

class _HomePageFormState extends State<HomePageForm> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Icon(
              Icons.person_outlined,
              size: 120,
              color: Colors.green,
            ),
          ),
          Input(text: "Peso (kg)"),
          Input(text: "Altura (cm)"),
          Button(title: "Calcular"),
          Text(
            "Informe seus dados!",
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}