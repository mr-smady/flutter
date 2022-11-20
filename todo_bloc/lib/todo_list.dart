import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/todo_form.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoGetAllEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            final list = state is TodoUpdated ? state.list : <Todo>[];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                final item = list[i];
                return Dismissible(
                  key: Key(item.id!.toString()),
                  onDismissed: (direction) {
                    context.read<TodoBloc>().add(
                          TodoDeleteEvent(id: item.id!),
                        );
                  },
                  child: ListTile(
                    title: Text(item.note!),
                    subtitle: Text(DateFormat.yMd().format(item.creationDate!),
                        textAlign: TextAlign.end),
                    trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TodoForm(
                            todo: item,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TodoForm(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      );
}
