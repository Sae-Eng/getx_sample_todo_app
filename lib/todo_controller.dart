import 'package:get/get.dart';

class TodoController extends GetxController {
  final todos = RxList<TodoItem>([]);

  void addTodo(String title) {
    todos.add(TodoItem(title: title));
  }

  void toggleDone(int index) {
    todos[index].isDone.toggle();
  }
}

class TodoItem {
  String title;
  RxBool isDone;

  TodoItem({required this.title, bool isDone = false}) : isDone = RxBool(isDone);
}
