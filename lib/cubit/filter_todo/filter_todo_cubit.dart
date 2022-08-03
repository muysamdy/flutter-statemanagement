import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/model/todo_model.dart';

part 'filter_todo_state.dart';

class FilterTodoCubit extends Cubit<FilterTodoState> {
  final List<Todo> initialTodos;

  FilterTodoCubit({
    required this.initialTodos,
  }) : super(FilterTodoState(filteredTodos: initialTodos));

  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;

      case Filter.completed:
        _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;

      case Filter.all:
      default:
        _filteredTodos = todos;
        break;
    }
    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTodos: _filteredTodos));
  }
}
