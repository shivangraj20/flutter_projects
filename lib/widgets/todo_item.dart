import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatelessWidget {

  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
          // print('Clicked on the task');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.yellow.shade200,
        leading: Icon( todo.isDone?
          Icons.check_box: Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.lightBlueAccent,
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 16,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
              // print('Delete button clicked');
            },
          ),
        ),
      ),
    );
  }
}
