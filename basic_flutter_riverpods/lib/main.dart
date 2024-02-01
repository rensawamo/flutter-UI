import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() {
  // アプリ
  const app = MaterialApp(home: Example());
  // プロバイダースコープでアプリを囲む
  const scope = ProviderScope(child: app);
  runApp(scope);
}

// プロバイダー
final nicknameProvider = StateProvider<String>((ref) {
  // 変化するデータ
  return "flutter-riverpodの基礎";
});

// 画面
class Example extends ConsumerWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // データを監視 ここは購読のみ
    final nickname = ref.watch(nicknameProvider);

    return Scaffold(
      appBar: AppBar(title: Text("flutter-riverpod 購読と発行")),
      body: SizedBox( //heightで設定した高さ、widthで設定した幅を持つ無色の長方形を用意するウィジェット
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ニックネーム 2
            Text(nickname),
            // ボタン A
            ElevatedButton(onPressed: () => tapA(ref), child: const Text('発行 remon')),
            // ボタン B
            ElevatedButton(onPressed: () => tapB(ref), child: const Text('発行 apple')),
            // ボタン C
            ElevatedButton(onPressed: () => tapC(ref), child: const Text('発行 mac')),
            // ニックネーム 3
            Text(nickname),
          ],
        ),
      ),
    );
  }

  // ノティファイア でデータを変更するときは notifier で変更可能になる
  tapA(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'remon';
  }

  tapB(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'apple';
  }

  tapC(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'mac';
  }
}