import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_entity.dart';

class TodoDetailScreen extends StatefulWidget {
  const TodoDetailScreen({
    super.key,
    required this.todo,
    required this.onToggleFavorite,
    required this.onDelete,
  });

  final TodoEntity todo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onDelete;

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.todo.isFavorite; // 처음 상태 가져오기
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite; // 상세 화면 아이콘 즉시 변경
    });
    widget.onToggleFavorite(); // Home 리스트에도 반영
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //왼쪽 뒤로가기 버튼
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(_isFavorite ? Icons.star : Icons.star_border), //현재 즐겨찾기 상태에 따라 아이콘 변경
          ),
          IconButton(
            onPressed: () {
              widget.onDelete(); //home에서 전달 받은 삭제 함수 실행
              Navigator.pop(context); //삭제 후 상세 화면 닫기
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), //화면 전체에 여백 20 적용
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //텍스트들 왼쪽 정렬
          children: [
            Text(
              widget.todo.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                decoration: //완료된 한 일인 경우 취소선 표시
                    widget.todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              (widget.todo.description == null ||
                      widget.todo.description!.trim().isEmpty) // description이 null이거나 공백이면 기본 안내 문구 표시
                  ? '세부 내용은 여기에 작성합니다.'
                  : widget.todo.description!,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}