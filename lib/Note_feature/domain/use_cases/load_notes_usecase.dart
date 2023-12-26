import 'package:noteit/Note_feature/data/repositories/repository_impl.dart';
import 'package:noteit/Note_feature/domain/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import '../entities/note_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoadNotesUseCase extends Equatable{

  final NoteRepository repository;

  const  LoadNotesUseCase({required this.repository,});

  Stream<QuerySnapshot<Map<String, dynamic>>> execute() {
   return repository.loadNotes();
  }

  @override
  List<Object?> get props => [repository];





  }
