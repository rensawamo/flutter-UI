import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'riverpod の familyの習得'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  int _counter = 1;

  // providerにパラムをとりたいときは、 autoDisposeでメモリリークをふせぐ
  // family + autodispose は定石
  final _apiProvider =
  FutureProvider.autoDispose.family<String, int>((ref, page) async {  // pageがパラムで intは その型 stringは返り値
    String url =
        'https://api.github.com/search/repositories?q=flutter&page=$page'; // paramを複数とる

    final client = http.Client();
    final response = await client.get(Uri.parse(url));
    final data = json.decode(response.body);
    final projectName = data['items'][0]['name'];
    return projectName;
  });

  // 更新(無効化して、再読み込み)
  void _incrementCounter(WidgetRef ref) {
    _counter++;
    ref.invalidate(_apiProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'クリックでfutureのproviderが更新にはしる',
            ),
            // 状態の切り替え
            ref.watch(_apiProvider(_counter)).when(
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => const Text('error'),
              data: (data) => Text(data),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(ref),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}