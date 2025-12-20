import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/homepage/todo_title.dart';

class TaskBox extends StatelessWidget{
  const TaskBox({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/empty_task.webp',
            width: 100,
            height: 100,
          ),
          SizedBox(height: 12),
          Text(
            '아직 할 일이 없음',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 12),
          Text(
            "할 일을 추가하고 ${TodoTitle.title}\n할 일을 추적하세요.",
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 14,
            height: 1.5,
          ),
          ),
          ],
      ),
    );
  }
}