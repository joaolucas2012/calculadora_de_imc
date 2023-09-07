import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page_form.dart';

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
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
          ],
        ),
        body: const HomePageForm(),
      ),
    );
  }
}
