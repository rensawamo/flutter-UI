import 'package:flutter/material.dart';

import 'new_expense.dart';
import 'expenses_list/expenses_list.dart';
import '../models/expense.dart';
import 'chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'サンプル１',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'サンプル２',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // モーダルボトムシートを表示するための関数
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    //2つのメソッドを連続して使用することで、まず既存のスナックバーをクリアし、その後新しいスナックバーを表示する、という一連のアクションを実現
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(  // 右スライドで  削除して その下にでる 戻せるようになるもの
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: '戻す',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget変数を定義
    Widget mainContent = const Center(
      child: Text('まだリストに追加されていません'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('買い物一覧'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
