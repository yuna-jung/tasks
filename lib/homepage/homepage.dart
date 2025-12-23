import 'package:flutter/material.dart';
import 'package:to_do_app/add_todo_page/bottom_sheet.dart';
import 'package:to_do_app/add_todo_page/todo_detail_screen.dart';
import 'package:to_do_app/add_todo_page/todo_view.dart';
import 'package:to_do_app/homepage/todo_taskbox.dart';
import 'package:to_do_app/homepage/todo_title.dart';
import 'package:to_do_app/models/todo_entity.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
//할 일 목록이 추가/삭제/토글되면서 화면이 바뀌어야 하므로 StatefulWidget 사용

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  List<TodoEntity> todos = [];

  void toggleDone(int index) { //index번째 todo를 꺼내서 isDone만 반대로 바꾼 새 객체로 교체
    final old = todos[index]; 
    setState(() {
      todos[index] = TodoEntity(
        title: old.title,
        description: old.description,
        isFavorite: old.isFavorite,
        isDone: !old.isDone, //완료 상태만 토글
      );
    });
  }

  void toggleFavorite(int index) {
    final old = todos[index];
    setState(() {
      todos[index] = TodoEntity(
        title: old.title,
        description: old.description,
        isFavorite: !old.isFavorite, //즐겨찾기만 토글
        isDone: old.isDone,
      );
    });
  }

  void deleteTodo(int index) { //index번째 항목을 리스트에서 제거하고 화면 갱신
    setState(() => todos.removeAt(index));
  }
  //FloatingActionButton을 눌렀을 때 BottomSheet를 열고 결과를 받아옴
  Future<void> _openAddTodoSheet() async {
    final result = await showModalBottomSheet<TodoEntity>( 
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddTodoBottomSheet(), //BottomSheet에 띄울 UI (할 일 입력 화면)
    );

    if (result == null) return; // 사용자가 저장하지 않고 닫으면(null 반환) 아무것도 하지 않음
    setState(() => todos.add(result)); // 저장을 눌러 TodoEntity가 반환되면 리스트에 추가하고 화면 갱신
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 올라와도 Scaffold 전체가 자동 리사이즈 되지 않게 함
      appBar: AppBar(title: TodoTitle()),
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: todos.isEmpty //할 일이 없으면 빈 화면(TaskBox)을 보여줌
            ? const TaskBox()
            : ListView.builder( //할 일이 있으면 ListView.builder로 목록 출력
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ToDoView(
                    toDo: todos[index],
                    onToggleDone: () => toggleDone(index), // 완료 토글 버튼 클릭 시 실행될 콜백
                    onToggleFavorite: () => toggleFavorite(index), // 즐겨찾기 토글 버튼 클릭 시 실행될 콜백
                    onTap: () {
                      debugPrint('push detail');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TodoDetailScreen( // 상세페이지에 todo 데이터 전달
                            todo: todos[index], 
                            onToggleFavorite: () => toggleFavorite(index), // 상세페이지에서 즐겨찾기 변경 시 홈 리스트에도 반영되도록 콜백 전달
                            onDelete: () => deleteTodo(index), // 상세페이지에서 삭제 시 홈 리스트에서도 삭제되도록 콜백 전달
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), //원형 버튼
        backgroundColor: Colors.lightGreen,
        onPressed: _openAddTodoSheet, // 버튼 클릭 시 BottomSheet가 열리도록 연결
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}