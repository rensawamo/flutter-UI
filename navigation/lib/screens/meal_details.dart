import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../providers/favorites_provider.dart';


// providerによって監視されるデータ
// build時の WidgetRef ref) {により   監視データにアクセス可能
class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal; // current meal

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    // 監視データから  hitするデータをあてられる
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold( // ヘッダーとボディ
        appBar: AppBar(title: Text(meal.title), actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref // bool
                  .read(favoriteMealsProvider.notifier) // StateNotifierProvider 動的 refの呼び出し(データを書き換える準備)
                  .toggleMealFavoriteStatus(meal); // 上記よりメソットの使用が可能になり stateを変更
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                // 下の一瞬の通知
                SnackBar(
                  content: Text(
                      wasAdded ? 'お気に入りに追加されました' : 'お気に入り登録を解除しました'),
                ),
              );
            },
            icon: AnimatedSwitcher( //アニメーションView
              duration: const Duration(milliseconds: 3000),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '材料',
                style: Theme.of(context).textTheme.titleLarge!.copyWith( // .captionとかtextThemeで大元を設定
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'ステップ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final step in meal.steps)
                Padding( // for の間のviewごとにもpadding対応可能
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
