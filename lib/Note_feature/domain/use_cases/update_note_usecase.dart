import 'package:noteit/Note_feature/data/repositories/repository_impl.dart';
import 'package:noteit/Note_feature/domain/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import '../entities/note_entity.dart';


class UpdateNoteUseCase extends Equatable{

  final NoteRepository repository;

  const UpdateNoteUseCase({required this.repository,});

  Future<void> execute( {required Note note, required Note updatedNote})async {
    await repository.updateNote(note,updatedNote);
  }

  @override
  List<Object?> get props => [repository];





}