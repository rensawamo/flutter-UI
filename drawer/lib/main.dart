import 'package:flutter/material.dart';
import 'side_menu.dart';

main() {
  // アップバー
  final appBar = AppBar(
    title: const Text('ハンバーガメニューの作成'),
  );

  // ドロワー
  const drawer = Drawer(
    child: SideMenu(),
  );


  // フローティングアクションボタン ≒ 画面上で主要なアクションを表すボタン
  final fab = FloatingActionButton(
    onPressed: () {
      debugPrint('FAB が押されました');
    },
    child: const Text('FAB'),
  );

  // ボディ
  const body = Center(
    child: Text('ハンバーガメニュー'),
  );

  // 画面
  final scaffold = Scaffold(
    // scaffoldの中にデフォで入る
    appBar: appBar,
    drawer: drawer, // 左から
    endDrawer: drawer, // 右から
    floatingActionButton: fab,
    body: body, // ボディ
  );

  // アプリ
  final app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: scaffold,
  );

  runApp(app);
}