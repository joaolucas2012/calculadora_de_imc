import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/classes/corestore.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/input.dart';

class HomePageForm extends StatefulWidget {
  final TextEditingController weightController;
  final TextEditingController heightController;
  final Function setButtonToVisible;
  final bool buttonIsVisible;

  const HomePageForm({
    Key? key,
    required this.weightController,
    required this.heightController,
    required this.setButtonToVisible,
    required this.buttonIsVisible,
  }) : super(key: key);

  @override
  State<HomePageForm> createState() => _HomePageFormState();
}

class _HomePageFormState extends State<HomePageForm> {
  @override
  Widget build(BuildContext context) {
    Map<bool, Color> colorOfBMI = {
      (CoreStore.info == null): Colors.purple,
      (CoreStore.info != null && !CoreStore.info!.contains("peso ideal")):
          Colors.red,
      (CoreStore.info != null && CoreStore.info!.contains("peso ideal")):
          Colors.green,
    };

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
              setButtonToVisible: widget.setButtonToVisible,
            ),
            Input(
              text: "Altura (cm)",
              controller: widget.heightController,
              setButtonToVisible: widget.setButtonToVisible,
            ),
            Button(
              title: "Calcular",
              calculate: widget.buttonIsVisible ? _calculateBMI : null,
            ),
            Text(
              (CoreStore.info != null)
                  ? CoreStore.info!
                  : "Informe seus dados!",
              style: TextStyle(
                color: colorOfBMI[true],
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

    double bmi = weight / (height * height);

    Map<bool, String> messageOfBMI = {
      (bmi < 18.6): ": você está abaixo do peso 🥺",
      (bmi >= 18.6 && bmi < 24.9): ": Você está no peso ideal 😄",
      (bmi >= 24.9 && bmi < 29.9): ": Você está levemente acima do peso 😅",
      (bmi >= 29.9 && bmi < 34.9): ": Você está com obesidade Grau I 🧐",
      (bmi >= 34.9 && bmi < 39.9): ": Você está com obesidade Grau II 😣",
      (bmi >= 40): ": Você está com obesidade Grau III 🤯",
    };

    setState(() {
      CoreStore.info =
          "Seu IMC é ${bmi.toStringAsPrecision(2)}${messageOfBMI[true]}";
    });
  }
}
