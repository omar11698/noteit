part of 'gridviewbloc_bloc.dart';

abstract class GridviewState extends Equatable {
  const GridviewState();
}

class NotesInitial extends GridviewState{
  @override
  List<Object?> get props =>[];
}
class NotesLoading extends GridviewState{
  @override
  List<Object?> get props =>[];
}
class NotesLoaded extends GridviewState{
  final Stream<QuerySnapshot<Map<String, dynamic>>> streamFirebase;

  const NotesLoaded({
    required this.streamFirebase,
  });

  @override
  List<Object?> get props => [streamFirebase];
}
class ErrorLoadingNotes extends GridviewState{

final String message;

const ErrorLoadingNotes({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
