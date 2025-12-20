import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_entity.dart';

class TodoDetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: 뒤로가기
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: 별(즐겨찾기) + 휴지통(삭제)
        actions: [
          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(todo.isFavorite ? Icons.star : Icons.star_border),
          ),
          IconButton(
            onPressed: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('삭제할까요?'),
                  content: const Text('이 할 일을 삭제합니다.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('취소'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('삭제'),
                    ),
                  ],
                ),
              );

              if (ok != true) return;

              onDelete(); // ✅ 홈 리스트에서 삭제
              if (context.mounted) Navigator.pop(context); // ✅ 상세 닫기
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
              todo.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              (todo.description == null || todo.description!.trim().isEmpty)
                  ? '세부 내용은 여기에 작성합니다.'
                  : todo.description!,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
