import 'package:flutter/material.dart';

//
// 画面 A
//
class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // opacityの表現は 50 ~ 900の番号であらわされる
      backgroundColor: Colors.red[300],
      body: const Center(
        child: Text(
          '画面 A',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}