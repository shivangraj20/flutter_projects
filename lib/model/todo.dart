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
      // ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
      // ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
      // ToDo(id: '03', todoText: 'Check Emails', isDone: false),
      // ToDo(id: '04', todoText: 'Team Meeting', isDone: false),
      // ToDo(id: '05', todoText: 'Work on mobile apps for 2 hours', ),
      // ToDo(id: '06', todoText: 'Dinner with Jenny', ),

    ];
  }


}