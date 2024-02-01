import 'package:flutter/material.dart';

/// メイン関数
void main() {
  // ホーム画面
  const home = Home();
  // アプリ
  const app = MaterialApp(home: home);
  runApp(app);
}

/// 馬のモデルクラス
class Horse {
  final String name;
  final String iconUri;
  Horse(this.name, this.iconUri);
}

/// カードにしたいモデルたち
final models = [
  Horse('ダミー１', 'dammy1.png'),
  Horse('ダミー２', 'dammy2.png'),
  Horse('ダミー３', 'dammy3.png'),
  Horse('ダミー４', 'dammy4.png'),
  Horse('ダミー５', 'dammy5.png'),
];

/// 馬のカード Widget
class HorseCard extends StatelessWidget {
  const HorseCard({
    super.key,
    required this.model,
  });
  final Horse model;

  @override
  Widget build(BuildContext context) {
    // 画像
    final img = SizedBox(
      height: 100,
      child: Image.asset(
        'assets/images/${model.iconUri}',
      ),
    );

    // 名前
    final text = Text(
      model.name,
      style: const TextStyle(fontSize: 20),
    );

    final imgAndText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        img,
        text,
      ],
    );

    // カード部分を作るコンテナ
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // 影の設定
            color: Colors.black.withOpacity(0.2), //色
            spreadRadius: 20, // 広がりの大きさ
            blurRadius: 11, // ぼかしの強さ
            offset: const Offset(0, 2), // 方向
          ),
        ],
      ),
      child: imgAndText,
    );
  }
}

// Wigtet は widgetの変数宣言
// パラムの受け取りが可能
Widget modelToWidget(Horse model) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: HorseCard(model: model),
  );
}

// ホーム画面
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final carousel = PageView.builder( // 横スクロールが可能
      controller: PageController(
        viewportFraction: 0.6,
      ),
      itemCount: models.length,
      itemBuilder: (c, i) => modelToWidget(models[i]),
    );

    // 画面
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          color: Colors.white,
          child: carousel,
        ),
      ),
    );
  }
}