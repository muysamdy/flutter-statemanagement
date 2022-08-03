part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();
}

class SetSearchTermEvent extends TodoSearchEvent {
  final String newSearchTerm;

  const SetSearchTermEvent({required this.newSearchTerm});

  @override
  String toString() {
    return 'SetSearchTermEvent{newSearchTerm: $newSearchTerm}';
  }

  @override
  List<Object> get props => [newSearchTerm];
}
