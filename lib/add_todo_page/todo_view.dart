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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // 그림자를 살짝 추가하면 사진처럼 박스가 더 선명해 보입니다.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 1. 체크 버튼 (두 번째 사진처럼 색상 변경)
          IconButton(
            onPressed: onToggleDone,
            icon: Icon(
              toDo.isDone ? Icons.check_circle : Icons.circle_outlined,
              // 완료 시에는 녹색(또는 테마색), 미완료 시에는 진한 회색
              color: toDo.isDone ? Colors.green : Colors.black54,
            ),
            iconSize: 24,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          const SizedBox(width: 12),

          // 2. 텍스트 영역 (취소선 적용)
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Text(
                toDo.title,
                style: TextStyle(
                  fontSize: 16,
                  // 완료 시 글자색을 흐리게(grey) 하고, 취소선을 긋습니다.
                  color: toDo.isDone ? Colors.grey : Colors.black,
                  decoration: toDo.isDone 
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none,
                  // 취소선의 두께나 색상을 더 명확하게 하고 싶을 때 (선택사항)
                  decorationColor: Colors.grey,
                  decorationThickness: 2.0,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 10),

          // 3. 즐겨찾기 별 아이콘
          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(
              toDo.isFavorite ? Icons.star : Icons.star_border,
              color: toDo.isFavorite ? Colors.black : Colors.black12,
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









// import 'package:flutter/material.dart';
// import 'package:to_do_app/models/todo_entity.dart';

// class ToDoView extends StatelessWidget {
//   const ToDoView({
//     super.key,
//     required this.onTap,
//     required this.toDo,
//     required this.onToggleFavorite,
//     required this.onToggleDone,
//   });

//   final VoidCallback onTap;
//   final TodoEntity toDo;
//   final VoidCallback onToggleFavorite;
//   final VoidCallback onToggleDone;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             onPressed: onToggleDone,
//             icon: Icon(
//               toDo.isDone ? Icons.check_circle : Icons.circle_outlined,
//             ),
//             iconSize: 22,
//             padding: EdgeInsets.zero,
//             constraints: const BoxConstraints(),
//             visualDensity: VisualDensity.compact,
//           ),

//           const SizedBox(width: 10),

//           // 텍스트 영역만 탭하면 상세 이동
//           Expanded(
//             child: InkWell(
//               onTap: onTap,
//               borderRadius: BorderRadius.circular(8),
//               child: Padding(
//                 // 탭 영역을 조금 넓혀서 누르기 편하게
//                 padding: const EdgeInsets.symmetric(vertical: 6),
//                 child: Text(
//                   toDo.title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     decoration: toDo.isDone ? TextDecoration.lineThrough : null,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(width: 10),

//           IconButton(
//             onPressed: onToggleFavorite,
//             icon: Icon(
//               toDo.isFavorite ? Icons.star : Icons.star_border,
//             ),
//             iconSize: 22,
//             padding: EdgeInsets.zero,
//             constraints: const BoxConstraints(),
//             visualDensity: VisualDensity.compact,
//           ),
//         ],
//       ),
//     );
//   }
// }