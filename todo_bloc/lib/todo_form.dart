import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/models/todo.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key, this.todo});

  final Todo? todo;

  @override
  State<StatefulWidget> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final _noteEditingController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      _noteEditingController.text = todo.note ?? '';
      _selectedDate = todo.creationDate ?? DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _noteEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid note';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.note),
                    hintText: 'enter your note',
                    labelText: 'Note',
                  ),
                ),
                InputDatePickerFormField(
                  initialDate: _selectedDate,
                  firstDate: DateTime(2015),
                  lastDate: DateTime(2050),
                  onDateSubmitted: (selectedDate) {
                    _selectedDate = selectedDate;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final todoEvent = widget.todo == null
                          ? TodoAddEvent(
                              todo: Todo(
                                  note: _noteEditingController.text,
                                  creationDate: _selectedDate),
                            )
                          : TodoUpdateEvent(
                              todo: Todo(
                                  id: widget.todo?.id,
                                  note: _noteEditingController.text,
                                  creationDate: _selectedDate),
                            );
                      context.read<TodoBloc>().add(todoEvent);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      );
}
