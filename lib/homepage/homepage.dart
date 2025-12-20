import 'package:flutter/material.dart';
import 'package:to_do_app/add_todo_page/bottom_sheet.dart';
import 'package:to_do_app/add_todo_page/todo_detail_screen.dart';
import 'package:to_do_app/add_todo_page/todo_view.dart';
import 'package:to_do_app/homepage/todo_taskbox.dart';
import 'package:to_do_app/homepage/todo_title.dart';
import 'package:to_do_app/models/todo_entity.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  List<TodoEntity> todos = [];

  void toggleDone(int index) {
    final old = todos[index];
    setState(() {
      todos[index] = TodoEntity(
        title: old.title,
        description: old.description,
        isFavorite: old.isFavorite,
        isDone: !old.isDone,
      );
    });
  }

  void toggleFavorite(int index) {
    final old = todos[index];
    setState(() {
      todos[index] = TodoEntity(
        title: old.title,
        description: old.description,
        isFavorite: !old.isFavorite,
        isDone: old.isDone,
      );
    });
  }

  void deleteTodo(int index) {
    setState(() => todos.removeAt(index));
  }

  Future<void> _openAddTodoSheet() async {
    final result = await showModalBottomSheet<TodoEntity>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddTodoBottomSheet(),
    );

    if (result == null) return;
    setState(() => todos.add(result));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: TodoTitle()),
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: todos.isEmpty
            ? const TaskBox()
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ToDoView(
                    toDo: todos[index],
                    onToggleDone: () => toggleDone(index),
                    onToggleFavorite: () => toggleFavorite(index),
                    onTap: () {
                      debugPrint('push detail');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TodoDetailScreen(
                            todo: todos[index],
                            onToggleFavorite: () => toggleFavorite(index),
                            onDelete: () => deleteTodo(index),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.lightGreen,
        onPressed: _openAddTodoSheet,
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
