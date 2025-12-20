import 'package:flutter/material.dart';
import 'package:to_do_app/add_todo_page/bottom_sheet.dart';
import 'package:to_do_app/add_todo_page/todo_detail_screen.dart';
import 'package:to_do_app/add_todo_page/todo_view.dart';
import 'package:to_do_app/homepage/todo_taskbox.dart';
import 'package:to_do_app/homepage/todo_title.dart';
import 'package:to_do_app/models/todo_entity.dart';

void main() {
  runApp(const MyApp()); //앱 실행
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nanum_Gothic', //전체 앱에 지정 폰트 선언
        useMaterial3: true,

        scaffoldBackgroundColor: Colors.grey[400], //백그라운드 그레이 컬러 지정

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, //appbar 컬러 지정
          foregroundColor: Colors.black, //앱바 전체의 앞쪽 요소인 글자색 컬러 지정
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen, // 메인 컬러 지정
          brightness: Brightness.light, //라이트 모드일 때 설정
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.light,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
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

  void addTodo(TodoEntity todo) {
    setState(() => todos.add(todo));
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
        shape: CircleBorder(),
        backgroundColor: Colors.lightGreen,
        onPressed: _openAddTodoSheet,
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
