import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

// 数値単体の監視の場合は @freeze をmodelから作成する必要はなく
// 数値の単体を監視する

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

//  * Methods
  void increament() => state++;

  void decrement() => state--;
}
