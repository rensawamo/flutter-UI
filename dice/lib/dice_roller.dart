import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

// StatefulWidget  は状態が時間とともに変化する可能性があるウィジェットを作成
// UIと状態の分離に役立つから StatefulWidgetにより 継承
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  //_DiceRollerState クラスの新しいインスタンスを返す
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  // 変数の状態更新
  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'lib/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.blue,
            textStyle: const TextStyle(
              fontSize: 21,
            ),
          ),
          child: const Text('ボタンの作成'),
        )
      ],
    );
  }
}
