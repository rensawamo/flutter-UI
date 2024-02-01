import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//
// 画面 A
//

//＜定石＞
//① gorouterに 画面を入れ込む
//② それぞれの画面で 戻る画面と 進む画面などの 定義を行う push pop

class PageA extends StatelessWidget {
  const PageA({super.key});
  // push は current contextに viewをいれこむ
  push(BuildContext context) {
    context.push('/b');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('画面 A'),
    );

    final pushButton = ElevatedButton(
      onPressed: () => push(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('進む >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pushButton,
          ],
        ),
      ),
    );
  }
}