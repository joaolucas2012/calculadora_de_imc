import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page_form.dart';
import 'package:flutter_application_1/utils/classes/corestore.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            "Calculadora de IMC",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: IconButton(
                  onPressed: _resetFields,
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        body: HomePageForm(
          weightController: weightController,
          heightController: heightController,
        ),
      ),
    );
  }

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      CoreStore.info = null;
    });
  }
}
