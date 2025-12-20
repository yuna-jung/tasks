import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_entity.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  bool _isFavorite = false;
  bool _showDescription = false;

  bool get _canSave => _titleController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    // 저장 버튼 활성/비활성 갱신을 위해 타이틀 입력 변화 감지
    _titleController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void saveTodo() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return; // title 비었으면 저장 안 함

    final todo = TodoEntity(
      title: title,
      description: _descController.text.trim().isEmpty
      ? null
      : _descController.text.trim(),
      isFavorite: _isFavorite,
    );

    Navigator.pop(context, todo); // Todo 객체 반환 + 닫기
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // 좌우 20, 위 12, 하단 0 (키보드 높이만큼만 추가)
        padding: EdgeInsets.fromLTRB(
          20,
          12,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              autofocus: true, // 바텀시트 뜨면 키보드 자동
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '새 할 일',
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
                isDense: true,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => saveTodo(), // 엔터 = 저장
            ),

            const SizedBox(height: 6),

            if (_showDescription)
              SizedBox(
                // 키보드 올라와도 화면 깨짐 방지용 최소 높이
                height: 120,
                child: Column(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _descController,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: '세부정보 추가',
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null, //줄바꿈 가능
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 4),
            // (2) 아이콘 줄 + 저장 버튼
            Row(
              children: [
                if (!_showDescription)
                  IconButton(
                    onPressed: () {
                      setState(() => _showDescription = true);
                    },
                    icon: const Icon(Icons.short_text_rounded, size: 24),
                  ),

                IconButton(
                  onPressed: () {
                    setState(() => _isFavorite = !_isFavorite);
                  },
                  icon: Icon(
                    _isFavorite ? Icons.star : Icons.star_border,
                    size: 24,
                  ),
                ),

                const Spacer(),

                TextButton(
                  onPressed: _canSave ? saveTodo : null, // 타이틀 있을 때만 활성
                  child: Text(
                    '저장',
                    style: TextStyle(
                      fontSize: 16,
                      // 활성/비활성 색상 차이
                      color: _canSave ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
                      ],
        ),
      )
    );
  }
}

            //description 입력창(줄바꿈 가능, size 14)
//             if (_showDescription)
//               SizedBox(
//                 // 키보드 올라와도 화면 깨짐 방지용 최소 높이
//                 height: 120,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _descController,
//                         style: const TextStyle(fontSize: 14),
//                         decoration: const InputDecoration(
//                           hintText: '세부정보 추가',
//                           hintStyle: TextStyle(fontSize: 14),
//                           border: InputBorder.none,
//                           isDense: true,
//                         ),
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null, //줄바꿈 가능
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
