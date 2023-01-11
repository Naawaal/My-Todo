import 'package:flutter/material.dart';
import 'package:my_todo/widgets/todo_list.dart';

import '../models/todo.dart';
import '../widgets/new_todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

final List<Todo> todo = [];
final addNewTodoController = TextEditingController();

class _HomepageState extends State<Homepage> {
  void _showModalButtonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTodo(
            addNewTodo: _addNewTodo,
          );
        });
  }

  //---------------------- _todoDelete ----------------------//
  void _deleteTodo(String id) {
    setState(() {
      todo.removeWhere((element) => element.id == id);
    });
  }

  //----------------------------------------------//
  void _checkBoxChanged(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  // ---------------------- Add New Todo ----------------------//
  void _addNewTodo(String toDo) {
    setState(() {
      todo.add(
          Todo(id: DateTime.now().toString(), todoTask: toDo, isDone: false));
      addNewTodoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: _appBar(),
        body: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return TodoList(
                todoDelete: _deleteTodo,
                ontodoChanged: _checkBoxChanged,
                todo: todo[index],
              );
            }));
  }

  //---------------------- AppBar ----------------------
  AppBar _appBar() {
    return AppBar(
      title: const Text(
        'My Todo',
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            _showModalButtonSheet(context);
          },
          icon: const Icon(
            Icons.add,
            color: Colors.blue,
            size: 25,
          ),
        ),
      ],
    );
  }
}
