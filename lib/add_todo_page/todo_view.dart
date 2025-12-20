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
  return GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () {
    debugPrint('👉 card tapped');
    onTap();
  },
  child: Container(
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
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            toDo.title,
            style: TextStyle(
              fontSize: 16,
              decoration:
                  toDo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: onToggleFavorite,
          icon: Icon(
            toDo.isFavorite ? Icons.star : Icons.star_border,
          ),
        ),
      ],
    ),
  ),
);
}