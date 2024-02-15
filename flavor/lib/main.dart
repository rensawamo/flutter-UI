import 'package:flutter/material.dart';


// flavor vscodeの使い方で
// scriptsで各々のflavorを設定
// vscodeでlaunch.jsonで  コマンドの設定
// libでflavorなどを適応させる


void main() {
  // フレーバー
  const flavor = String.fromEnvironment('flavor');

  if (flavor == 'dev') {
  }

  if (flavor == 'stg') {
    debugPrint('stg');
  }

  if (flavor == 'prd') {
  }

  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('バナナ'),
      ),
    );
  }
}

