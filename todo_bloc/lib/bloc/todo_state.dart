part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoUpdated extends TodoState {
  const TodoUpdated({required this.list});
  final List<Todo> list;

  @override
  List<Object> get props => [list];
}
