import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'page_a.dart';
import 'page_b.dart';
import 'page_c.dart';

main() {
  const app = MaterialApp(home: Root());

  const scope = ProviderScope(child: app);
  runApp(scope);
}

// bottom のタブのナンバー
// StateProvider は外部から変更が可能なステート（状態）を公開するプロバイダです。 StateNotifierProvider
// の簡易版であり、ステートの管理にわざわざ StateNotifier クラスを定義するほどではない場合にご利用いただけます。
// 単体を監視するときとかに活躍
final indexProvider = StateProvider((ref) {
  // 変化するデータ 0, 1, 2...
  return 0;
});



// 画面全体
class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックス
    final index = ref.watch(indexProvider);

    // ① タブのデザインを決定
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'tab1',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'tab2',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'tab3',
      ),
    ];

    // ②①の挙動
    final bar = BottomNavigationBar(
      items: items, // アイテムたち
      backgroundColor: Colors.brown, // tab barの背景色
      selectedItemColor: Colors.white, // selected chara color
      unselectedItemColor: Colors.black, // unselected
      currentIndex: index, // インデックス
      onTap: (index) {
        // タップされたとき インデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
    );

    //  ③ 画面を入れ込む
    const pages = [
      PageA(),
      PageB(),
      PageC(),
    ];

    // appverは必需品ではない
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );
  }
}