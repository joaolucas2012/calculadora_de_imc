import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/classes/corestore.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/input.dart';

class HomePageForm extends StatefulWidget {
  final TextEditingController weightController;
  final TextEditingController heightController;

  const HomePageForm({
    Key? key,
    required this.weightController,
    required this.heightController,
  }) : super(key: key);

  @override
  State<HomePageForm> createState() => _HomePageFormState();
}

class _HomePageFormState extends State<HomePageForm> {
  bool buttonIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Icon(
                Icons.person_outlined,
                size: 120,
                color: Colors.purple,
              ),
            ),
            Input(
              text: "Peso (kg)",
              controller: widget.weightController,
              setButtonToVisible: _setButtonToVisible,
            ),
            Input(
              text: "Altura (cm)",
              controller: widget.heightController,
              setButtonToVisible: _setButtonToVisible,
            ),
            Button(
              title: "Calcular",
              calculate: buttonIsVisible ? _calculateBMI : null,
            ),
            Text(
              (CoreStore.info != null)
                  ? "Seu IMC é ${CoreStore.info!.toStringAsPrecision(2)}"
                  : "Informe seus dados!",
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double weight = double.parse(widget.weightController.text);
    double height = double.parse(widget.heightController.text) / 100;
    setState(() {
      CoreStore.info = weight / (height * height);
    });
  }

  void _setButtonToVisible() {
    setState(() {
      buttonIsVisible = widget.weightController.text.isNotEmpty &&
          widget.heightController.text.isNotEmpty;
    });
  }
}
