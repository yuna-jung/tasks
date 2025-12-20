import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_entity.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({
    super.key,
    required this.onTap,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final VoidCallback onTap;
  final TodoEntity toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onToggleDone,
            icon: Icon(
              toDo.isDone ? Icons.check_circle : Icons.circle_outlined,
            ),
            iconSize: 22,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
          ),

          const SizedBox(width: 10),

          // 텍스트 영역만 탭하면 상세 이동
          Expanded(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                // 탭 영역을 조금 넓혀서 누르기 편하게
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  toDo.title,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: toDo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(
              toDo.isFavorite ? Icons.star : Icons.star_border,
            ),
            iconSize: 22,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
