import 'package:flutter/material.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme 위젯으로 감싸서 이 하위 위젯들은 라이트 모드 테마를 따르게 합니다.
    return Theme(
      data: ThemeData.light(), 
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200], // 밝은 회색 배경
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/empty_task.webp',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 12),
            Builder( // 새로운 테마 컨텍스트를 사용하기 위해 Builder 사용
              builder: (innerContext) => Text(
                '아직 할 일이 없음',
                style: Theme.of(innerContext).textTheme.titleMedium?.copyWith(
                  color: Colors.black, // 명시적으로 어두운 색상 지정
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Builder(
              builder: (innerContext) => Text(
                "할 일을 추가하고 유나's Tasks\n할 일을 추적하세요.",
                textAlign: TextAlign.center,
                style: Theme.of(innerContext).textTheme.bodyMedium?.copyWith(
                  color: Colors.black54, // 보조 문구는 조금 더 연한 검정
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class TaskBox extends StatelessWidget{
//   const TaskBox({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//       color: Colors.grey[200],
//       borderRadius: BorderRadius.circular(12)
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             'assets/images/empty_task.webp',
//             width: 100,
//             height: 100,
//           ),
//           SizedBox(height: 12),
//           Text(
//             '아직 할 일이 없음',
//             style: Theme.of(context).textTheme.titleMedium,
//           ),
//           // Text(
//           //   '아직 할 일이 없음',
//           //   style: TextStyle(
//           //     fontSize: 16,
//           //     fontWeight: FontWeight.bold
//           //   ),
//           // ),
//           SizedBox(height: 12),
//           Text(
//             "할 일을 추가하고 유나's Tasks\n할 일을 추적하세요.",
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//           // Text(
//           //   "할 일을 추가하고 ${TodoTitle.title}\n할 일을 추적하세요.",
//           //   textAlign: TextAlign.center,
//           //   style: TextStyle(
//           //   fontSize: 14,
//           //   height: 1.5,
//           // ),
//           // ),
//           ],
//       ),
//     );
//   }
// }