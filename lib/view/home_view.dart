import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 219, 143, 2),
        child: const Center(
            child: Text(
          "Hello world",
          style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
