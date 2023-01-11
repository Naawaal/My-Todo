import 'package:flutter/material.dart';

class NewTodo extends StatelessWidget {
  final Function addNewTodo;
  const NewTodo({
    super.key,
    required this.addNewTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: addNewTodoController,
                decoration: const InputDecoration(
                  labelText: 'Add New Todo',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      addNewTodo(addNewTodoController.text);
                      addNewTodoController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Add New Todo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ));
  }
}

final addNewTodoController = TextEditingController();
