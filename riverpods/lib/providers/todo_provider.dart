import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/todo_model.dart';

part 'todo_provider.g.dart';


// Dartでは、オブジェクトの中身の中身の値の変更を監視するときに
// freezeを使うことによってimmutable化する

// 使い方
// ① part 'todo_provider.g.dart'; などの partファイルを作成する


@riverpod
class Todos extends _$Todos {
  @override
  List<TodoModel> build() {
    return [];
  }

  // * Methods
  void addTodo(TodoModel todo) {
    state = [todo, ...state];
  }

  void toggleTodo(int id, bool isCompleted) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: isCompleted) else todo
    ];
  }
}
