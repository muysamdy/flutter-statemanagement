part of 'todo_filter_bloc.dart';

class TodoFilterState extends Equatable {
  const TodoFilterState({required this.filter});

  final Filter filter;

  TodoFilterState copyWith({Filter? filter}) =>
      TodoFilterState(filter: filter ?? this.filter);

  factory TodoFilterState.initial() => const TodoFilterState(filter: Filter.all);

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  @override
  List<Object> get props => [filter];
}
