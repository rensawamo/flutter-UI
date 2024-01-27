import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';


// StateNotifierProvider 動的
// ↓ 静的
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
