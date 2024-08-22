import 'package:flutter/material.dart';
import 'package:flutter_learn/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

// stateless widget

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter learn",
      home: HomeView(),
    );
  }
}
