class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Thể dục buổi sáng', isDone: true ),
      ToDo(id: '02', todoText: 'Ăn sáng', isDone: true ),
      ToDo(id: '03', todoText: 'Check Emails', ),
      ToDo(id: '04', todoText: 'Họp nhóm', ),
      ToDo(id: '05', todoText: 'Làm việc trên ứng dụng di động trong 2 giờ', ),
      ToDo(id: '06', todoText: 'Ăn tối', ),
    ];
  }
}