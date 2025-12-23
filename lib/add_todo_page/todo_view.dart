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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), //카드 간 간격
      padding: const EdgeInsets.all(16), //카드 내부 여백
      decoration: BoxDecoration(
        color: Colors.white, //카드 배경색
        borderRadius: BorderRadius.circular(12),
        
        boxShadow: [ //박스 그림자 추가
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row( //카드 내부 요소들은 가로로 배치
        children: [
          
          IconButton( // 완료 체크 버튼
            onPressed: onToggleDone,
            icon: Icon(
              toDo.isDone ? Icons.check_circle : Icons.circle_outlined,
              // 완료 여부에 따라 아이콘 변경
              color: toDo.isDone ? Colors.black : Colors.black,
            ),
            iconSize: 24,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          const SizedBox(width: 12),

          // 텍스트 영역 (취소선 적용)
          Expanded(
            child: InkWell( //텍스트 영역만 탭 가능하게 설정
              onTap: onTap, //상세 페이지로 이동
              child: Text(
                toDo.title,
                style: TextStyle(
                  fontSize: 16,
                  color: toDo.isDone ? Colors.black : Colors.black,
                  decoration: toDo.isDone //완료된 한 일은 취소선 표시
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none,
                  decorationColor: Colors.grey, //취소선 스타일 설정
                  decorationThickness: 2.0,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // 즐겨찾기 별 아이콘
          IconButton(
            onPressed: onToggleFavorite, //즐겨찾기 상태 토글
            icon: Icon( //즐겨 찾기 여부에 따라 아이콘 변경
              toDo.isFavorite ? Icons.star : Icons.star_border,
              color: toDo.isFavorite ? Colors.black : Colors.black,
            ),
            iconSize: 22,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}