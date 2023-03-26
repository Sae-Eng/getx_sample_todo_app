import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'todo_controller.dart';

class TodoApp extends GetView<TodoController> {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('GetX Todo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'タスクを入力してください。',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            // リスト全体を監視
            child: Obx(
              () => ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Obx(
                      // チェックボックスの状態を監視
                      () => Checkbox(
                        value: controller.todos[index].isDone.value,
                        onChanged: (value) {
                          controller.toggleDone(index);
                        },
                      ),
                    ),
                    title: Obx(
                      // テキストの状態を監視
                      () => Text(
                        controller.todos[index].title,
                        style: controller.todos[index].isDone.value
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addTodo(textController.text);
          textController.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
