import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(0, 0, 0, 0),
          Color.fromARGB(255, 68, 21, 149),
        ),
      ),
    ),
  );
}
