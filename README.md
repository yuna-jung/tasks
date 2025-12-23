## To-Do App

### 주요 특징

1. BottomSheet 기반 할 일 추가  
  : showModalBottomSheet를 사용해 입력 화면을 표시,
  Navigator.pop을 통해 TodoEntity 객체를 반환받아 홈 화면의 리스트에 반영

2. 상태 관리 구조  
  : Homepage를 StatefulWidget으로 구성했으며,
  List<TodoEntity>를 상태로 관리하며 setState를 통해 UI를 갱신

3. 카드 UI와 제스처 분리  
  체크 버튼과 즐겨찾기 버튼은 IconButton으로 개별 동작을 처리했으며,
  텍스트 영역에만 InkWell을 적용해 상세 페이지로 이동하도록 구현

4. 상세 화면 기능  
  상세 페이지에서 즐겨찾기 토글과 삭제 기능을 제공하며
  삭제 시 홈 화면의 리스트에서도 해당 항목이 제거되도록 콜백으로 연결했다.

5. 데이터 모델 분리  
  TodoEntity 클래스를 통해 할 일의 제목, 설명, 완료 여부, 즐겨찾기 여부를 관리하고,
  모든 상태 변경은 새로운 객체를 생성해 리스트를 갱신하는 방식으로 처리했다.

파일 분리

* main.dart
  MaterialApp을 사용해 라이트/다크 테마를 설정하고 Homepage를 시작 화면으로 지정

* homepage.dart
  할 일 목록 상태 관리, BottomSheet 호출, 리스트 렌더링 및 상세 화면 이동 처리

* bottom_sheet.dart
  할 일 입력 UI 구현, 키보드 대응 처리, 입력값을 TodoEntity로 반환

* todo_view.dart
  할 일 카드 UI 구성, 완료/즐겨찾기 토글과 상세 이동 제스처 분리

* todo_detail_screen.dart
  할 일 상세 정보 표시, 즐겨찾기 및 삭제 기능 제공
