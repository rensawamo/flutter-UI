import 'package:flutter/material.dart';

enum Priority { urgent, normal, low }

// 受け取り側での状態管理
class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  State<CheckableTodoItem> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (widget.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (widget.priority == Priority.normal) {
      icon = Icons.list;
    }

    return Padding(
      // 外枠を開ける
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.red, // 背景色を赤色に設定
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(value: _done, onChanged: _setDone),
            const SizedBox(width: 6),
            Icon(icon),
            const SizedBox(width: 12),
            Text(widget.text),
          ],
        ),
      ),
    );

  }
}
