import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('ハンバーガメニュ'),
          ),
        ),
        ListTile(
          title: const Text('ListTile A'),
          onTap: () {
            debugPrint('リストタイル A をタップしました');
          },
        ),
        Divider(), // 横線
        ListTile(  // リストの一行の型
          leading: FlutterLogo(),
          title: Text("5行目"),
          subtitle: Text("サブタイトル"),
          trailing: Icon(Icons.more_vert),
        ),
        Divider(),

        ListTile(
          leading: FlutterLogo(),
          title: Text("6行目"),
          subtitle: Text("サブタイトルサブタイトルサブタイトルサブタイトル"),
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
        ),
        Divider(),
      ],
    );
  }
}