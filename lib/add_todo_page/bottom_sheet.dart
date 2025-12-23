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
  void dispose() { // 컨트롤러는 반드시 dispose 해줘야 메모리 누수 방지가 가능함
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
      ? null  // description이 비어있으면 null
      : _descController.text.trim(),
      isFavorite: _isFavorite,
    );

    Navigator.pop(context, todo); // BottomSheet를 닫으면서 TodoEntity를 결과로 반환
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        
        padding: EdgeInsets.fromLTRB( // 좌우 20, 위 12, 하단 0 (키보드 높이만큼만 추가)
          20,
          12,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // BottomSheet 높이를 내용만큼만 차지하도록 설정
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController, // 할 일 제목 입력 TextField
              autofocus: true, // 바텀시트 뜨면 키보드 자동 표시
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '새 할 일',
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
                isDense: true,
              ),
              textInputAction: TextInputAction.done, // 키보드의 완료 버튼을 누르면 저장
              onSubmitted: (_) => saveTodo(), // 엔터 = 저장
            ),

            const SizedBox(height: 6),

            if (_showDescription)
              SizedBox(
                // 키보드가 올라와도 레이아웃이 깨지지 않도록 고정 높이 사용
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
            // 아이콘 줄 + 저장 버튼
            Row(
              children: [
                if (!_showDescription) // description 입력창이 보일 때는 숨김
                  IconButton(
                    onPressed: () {
                      setState(() => _showDescription = true);
                    },
                    icon: const Icon(Icons.short_text_rounded, size: 24),
                  ),

                IconButton( //즐겨 찾기 토글 아이콘
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
                      color: _canSave ? Colors.white : Colors.white,
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