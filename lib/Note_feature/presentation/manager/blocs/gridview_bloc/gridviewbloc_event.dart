part of 'gridviewbloc_bloc.dart';

abstract class GridviewEvent extends Equatable {
  const GridviewEvent();
}
class AddNote extends GridviewEvent{
  final Note note;

  const AddNote({
    required this.note,
  });

  @override
  List<Object?> get props => [note];
}
class DeleteNote extends GridviewEvent{
  Note note;

  DeleteNote({
    required this.note,
  });

  @override
  List<Object?> get props => [note];
}
class UpdateNote extends GridviewEvent{
  final Note note;
  final Note newNote;

  @override
  List<Object?> get props =>[note,newNote];

  const UpdateNote({
    required this.note,
    required this.newNote,
  });
}
class LoadNotes extends GridviewEvent{
  @override

  List<Object?> get props => [];

}
