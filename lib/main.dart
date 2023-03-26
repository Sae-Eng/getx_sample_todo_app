import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'todo_app.dart';
import 'todo_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoApp(),
      initialBinding: BindingsBuilder(() => {Get.put(TodoController())}),
    );
  }
}
