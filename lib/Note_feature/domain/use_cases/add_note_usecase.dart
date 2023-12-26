import 'package:noteit/Note_feature/domain/repositories/repository.dart';
 import 'package:equatable/equatable.dart';

import '../entities/note_entity.dart';

  class AddNoteUseCase extends Equatable{

  final NoteRepository repository;

  const AddNoteUseCase({required this.repository,});

    Future<void> execute(Note note)async {
    await repository.addNote(note);
   }

  @override
  List<Object?> get props => [repository];





}