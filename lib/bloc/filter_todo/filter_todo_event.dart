part of 'filter_todo_bloc.dart';

abstract class FilterTodoEvent extends Equatable {
  const FilterTodoEvent();
}

class CalculateFilteredTodoEvent extends FilterTodoEvent {
  final List<Todo> filteredTodos;

  const CalculateFilteredTodoEvent({required this.filteredTodos});

  @override
  String toString() => 'CalculateFilteredTodoEvent(filteredTodos: $filteredTodos)';

  @override
  List<Object> get props => [filteredTodos];
}
