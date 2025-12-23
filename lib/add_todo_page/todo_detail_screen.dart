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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(_isFavorite ? Icons.star : Icons.star_border),
          ),
          IconButton(
            onPressed: () {
              widget.onDelete();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.todo.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                decoration:
                    widget.todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              (widget.todo.description == null ||
                      widget.todo.description!.trim().isEmpty)
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