// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculatorview extends StatefulWidget {
  const Calculatorview({super.key});

  @override
  State<Calculatorview> createState() => _CalculatorviewState();
}

class _CalculatorviewState extends State<Calculatorview> {
  int x = 0;
  int y = 0;
  num z = 0;

  late final AppLifecycleListener _listener;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
      // onExitRequested: onExitRequested,
    );
  }

  void _onShow() => print("void onshow");

  void _onHide() => print("onhide called");

  void _onResume() => print("session resumed");

  void _onDetach() => print("onDetach callled");

  void _onInactive() => print("on Inactive called");

  void _onPause() => print("on pause called");

  void _onRestart() => print("Restart called");

  void _onStateChange(AppLifecycleState state) {
    print("onstate change called");
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          calculatorDisplay(
              hint: "Enter first number", controller: displayOneController),
          SizedBox(
            height: 30,
          ),
          calculatorDisplay(
              hint: "Enter second number", controller: displayTwoController),
          SizedBox(
            height: 30,
          ),
          Text(
            key: const Key("Result"),
            z.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: const Text("Clear"),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class calculatorDisplay extends StatelessWidget {
  const calculatorDisplay({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3),
            borderRadius: BorderRadius.circular(10)),
        hintText: hint,
        labelText: "Calculate",
      ),
    );
  }
}
