import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

// StateNotifierのインスタンスをアプリケーションのどの部分からでもアクセス可能にし、UIコンポーネントが状態の変更に反応して自動的に再構築
// 定石として何を監視しているかは <Map<Filter, bool>ここをみればよい
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  // 関数名と その定義の statenotifierで 状態を保持する
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  // 一括リセットの機能
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed! => mutating state
    // StateNotifier<Map<Filter, bool>ここのmapを監視しているから
    // fillerでキーを指定してvalueをかえる関数を作成できるといえる
    state = {
      ...state,
      filter: isActive,
    };
  }
}


// 初期化関数
// StateNotifierProvider
// アプリケーション全体で Map<Filter, bool> を監視している
final filtersProvider =

// 加工されれるデータで全体共有
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);



// ProviderはStateNotifierProviderを集めているよ
// 返す食事データの選別
// 静的(完成されたデータをproviderでアプリ全体共有)
final filteredMealsProvider = Provider((ref) {
  // dammyの食事データを返す
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
