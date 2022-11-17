import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:http/http.dart' as http;

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
          onPressed: () async {
            var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
            var response = await http.post(url,
                body: jsonEncode({
                  "userId": 1,
                  "title":
                      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                  "body":
                      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                }));
            print(response.statusCode);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      );
}
