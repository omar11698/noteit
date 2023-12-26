import 'package:noteit/Note_feature/data/repositories/repository_impl.dart';
import 'package:noteit/Note_feature/domain/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import '../entities/note_entity.dart';


class DeleteNoteUseCase extends Equatable{

  final NoteRepository repository;

  const DeleteNoteUseCase({required this.repository,});

  Future<void> execute(Note note)async {
    await repository.deleteNote(note);
  }

  @override
  List<Object?> get props => [repository];





}