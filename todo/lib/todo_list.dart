import 'package:flutter/material.dart';
import 'package:todo/main.dart';

import 'models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo>? _list;

  updateTodoList() async {
    _list = await todoList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateTodoList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView.builder(
          itemCount: _list == null ? 0 : _list?.length,
          itemBuilder: (context, i) {
            final item = _list![i];
            return Dismissible(
              key: Key(item.id!.toString()),
              onDismissed: (direction) async {
                await deleteTodo(item.id!);
                setState(() {
                  _list?.removeAt(i);
                });
              },
              child: ListTile(
                title: Text(_list![i].note!),
                subtitle: Text(_list![i].creationDate!.toString(),
                    textAlign: TextAlign.end),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            insert(
              Todo(
                note: 'Test 1',
                creationDate: DateTime.now(),
              ),
            );
            updateTodoList();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      );
}
