import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        // 上下 左右 のpadding のつけ方などが可能
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // defalult vstack
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 11), // spacer に近い
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}ドル',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
