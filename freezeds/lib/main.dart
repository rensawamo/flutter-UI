import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'list.dart';
import 'fish.dart';

// メイン関数
void main() {
  const app = MaterialApp(home: Home());
  const scope = ProviderScope(child: app);
  runApp(scope);
}

// オブジェクトデータ
final fishProvider = StateProvider((ref) {
  return const Fish(
    name: 'さかな',
    size: 7777,
    price: 77777,
  );
});


// ABCリストの状態管理
final abcListProvider = StateProvider((ref) {
  return AbcList([
    'A',
    'B',
    'C',
  ]);
});

// ホーム画面
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fish = ref.watch(fishProvider);
    final abcList = ref.watch(abcListProvider);

    // from オブジェクト
    final nameText = Text(
      '名前: ${fish.name}',
    );
    final sizeText = Text(
      '大きさ: ${fish.size} cm',
    );
    final priceText = Text(
      '値段: ${fish.price} 万円',
    );
    final abcListText = Text(
      'ABCリスト: $abcList',
    );

    // ボタン
    final button = ElevatedButton(
      onPressed: () => onPressed(ref),
      child: const Text('変更する'),
    );

    // 縦に並べるカラム
    final column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        nameText,
        sizeText,
        priceText,
        abcListText,
        button,
      ],
    );

    return Scaffold(
      body: Center(
        child: column,
      ),
    );
  }

  void onPressed(WidgetRef ref) {
    final fish = ref.read(fishProvider);
    final newFish = fish.copyWith( // オブジェクトごと入れ替える
      price: 1234,
    );
    ref.read(fishProvider.notifier).state = newFish;

    // 今画面に出ているABCリスト
    final abcList = ref.read(abcListProvider);

    // 入れ物ごと変えた 新しいABCリスト
    final newAbcList = abcList.copyWith(
      // D を追加する
      values: abcList.values + ['ADD'],
    );

    // 画面を変更する
    ref.read(abcListProvider.notifier).state = newAbcList;
  }
}