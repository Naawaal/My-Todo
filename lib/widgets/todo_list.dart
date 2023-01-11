import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoList extends StatelessWidget {
  final Todo todo;

  final ontodoChanged;
  final todoDelete;

  const TodoList({
    super.key,
    required this.todo,
    this.ontodoChanged,
    this.todoDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            onTap: () {
              ontodoChanged(todo);
            },
            title: Text(
              todo.todoTask,
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: todo.isDone ? Colors.green : Colors.grey,
            ),
            trailing: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  todoDelete(todo.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
