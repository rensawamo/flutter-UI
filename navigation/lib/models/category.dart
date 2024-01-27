import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange, // 初期値があらかじめ決まっている場合
  });

  final String id;
  final String title;
  final Color color;
}
