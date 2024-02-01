import 'package:flutter/material.dart';

// ツイート
class Tweet {
  final String userName;
  final String iconUrl;
  final String text;
  final String createdAt;
  Tweet(this.userName, this.iconUrl, this.text, this.createdAt);
}

// 適当なモデル
// by gpt プログラミング言語になったつもりでツイート
final models = [
  Tweet('Python', 'icon1.png', 'エレガントなコードで世界を変える！', '2022/1/1'),
  Tweet('Java', 'icon2.png', '一度書けば、どこでも動く！', '2022/1/2'),
  Tweet('JavaScript', 'icon3.png', 'ウェブの力を最大限に引き出す！', '2022/1/3'),
  Tweet('C#', 'icon4.png', '強力なアプリケーションを簡単に開発！', '2022/1/4'),
  Tweet('Ruby', 'icon5.png', 'プログラミングの楽しさを伝える！', '2022/1/5'),
  Tweet('C++', 'icon6.png', 'パフォーマンスと効率のバランスを取る！', '2022/1/6'),
  Tweet('PHP', 'icon7.png', 'ウェブをもっと手軽に！', '2022/1/7'),
  Tweet('Swift', 'icon8.png', 'iOSの世界をリードする！', '2022/1/8'),
  Tweet('Kotlin', 'icon9.png', 'Android開発の新時代！', '2022/1/9'),
  Tweet('Go', 'icon10.png', '速くて信頼性の高いソフトウェア！', '2022/1/10'),
  Tweet('Rust', 'icon11.png', 'メモリ安全性を保証！', '2022/1/11'),
  Tweet('TypeScript', 'icon1.png', 'JavaScriptに型の力を！', '2022/2/1'),
  Tweet('Scala', 'icon2.png', '関数型プログラミングとオブジェクト指向を融合！', '2022/2/2'),
  Tweet('Dart', 'icon3.png', 'フロントエンドとバックエンドの統合！', '2022/2/3'),
  Tweet('Elixir', 'icon4.png', '並行処理と耐障害性を備えたウェブ開発！', '2022/2/4'),
  Tweet('Haskell', 'icon5.png', '数学的な美しさと純粋関数型プログラミング！', '2022/2/5'),
  Tweet('Perl', 'icon6.png', '多様な機能を備えたスクリプト言語！', '2022/2/6'),
  Tweet('R', 'icon7.png', 'データ解析と統計計算のための言語！', '2022/2/7'),
  Tweet('Lua', 'icon8.png', '軽量で拡張性の高いスクリプト言語！', '2022/1/8'),
  Tweet('Clojure', 'icon9.png', 'LISPの力を活かした動的言語！', '2022/2/9'),
  Tweet('F#', 'icon10.png', '.NETで動く関数型言語！', '2022/2/10'),
  Tweet('Groovy', 'icon11.png', 'Javaプラットフォームのための動的言語！', '2022/2/11'),
  Tweet('Elm', 'icon1.png', '信頼性の高いフロントエンド開発！', '2022/3/1'),
];


// モデル => ウィジェット に変換する
Widget modelToWidget(Tweet model) {
  // ユーザーアイコン
  final icon = Container(
    margin: const EdgeInsets.all(20),
    width: 60,
    height: 60,
    // 画像を丸くする
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('assets/images/${model.iconUrl}'),
    ),
  );

  // 箱に左詰めで 日付をいれる
  final metaText = Container(
    padding: const EdgeInsets.all(6),
    height: 40,
    alignment: Alignment.centerLeft,
    child: Text(
      '${model.userName}    ${model.createdAt}',
      style: const TextStyle(color: Colors.grey),
    ),
  );

  // 箱に本文を左づめで入れる
  final text = Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerLeft,
    child: Text(
      model.text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  // 部品を並べ
  return Container(
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      // 全体を赤い枠線で囲む
      border: Border.all(color: Colors.red),
      color: Colors.white,
    ),
    width: double.infinity,
    // 高さ
    height: 120,
    child: Row(
      children: [
        icon,
        Expanded(
          child: Column(
            children: [
              metaText,
              text,
            ],
          ),
        ),
      ],
    ),
  );
}

// メイン関数
void main() {
  // ツイートのリスト
  final list = ListView.builder(
    itemCount: models.length,
    itemBuilder: (c, i) => modelToWidget(models[i]),
  );

  // 全体
  final con = Center(
    child: SizedBox(
      child: list,
    ),
  );

  // 画面
  final sca = Scaffold(
    backgroundColor: Colors.grey,
    body: con,
  );

  // アプリ
  final app = MaterialApp(home: sca);
  // アプリを動かす
  runApp(app);
}