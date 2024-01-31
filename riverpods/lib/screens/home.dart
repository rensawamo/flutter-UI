import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("river アプリ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("riverpod での状態管理を行います"),

            //Consumer Widgetの中に監視の変数を用意
            // Widget? child は 監視している ref.watchの値が変わるたびに再描写される合図
            // SwiftUI でいう @State varに依存する View
            Consumer(builder: (context, WidgetRef ref, Widget? child) {
              final counter = ref.watch(counterProvider);
              return Text(
                counter.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            }),
            ElevatedButton(
                onPressed: () => {
                      ref.read(counterProvider.notifier).decrement(),
                    },
                child: const Icon(Icons.remove))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          ref.read(counterProvider.notifier).increament(),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
