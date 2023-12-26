import 'package:noteit/Note_feature/data/remote/data_sources/Firebase.dart';
import 'package:noteit/Note_feature/domain/entities/note_entity.dart';
import 'package:noteit/Note_feature/domain/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../remote/models/note_model.dart';

class NoteRepositoryImpl extends NoteRepository {
  FirebaseRemoteDataSource firebaseRemoteDataSource;

  NoteRepositoryImpl({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<void> addNote(Note note) async {
    NoteModel noteModel = NoteModel(
        title: note.title,
        body: note.body,
        id: note.id,
        dateTime: note.dateTime,
        color: note.color);

    await firebaseRemoteDataSource.addNoteToCollection(noteModel);
  }

  @override
  Future<void> deleteNote(Note note) async {
    NoteModel noteModel = NoteModel(
        title: note.title,
        body: note.body,
        id: note.id,
        dateTime: note.dateTime,
        color: note.color);
    await firebaseRemoteDataSource.deleteNoteFromCollection(noteModel);
  }

  @override
  Future<void> updateNote(Note note, Note updatedNote) async {

    NoteModel noteModel = NoteModel(
        title: note.title,
        body: note.body,
        id: note.id,
        dateTime: note.dateTime,
        color: note.color);
    NoteModel updatedNoteModel = NoteModel(
        title: updatedNote.title,
        body: updatedNote.body,
        id: updatedNote.id,
        dateTime: updatedNote.dateTime,
        color: updatedNote.color);

    await firebaseRemoteDataSource.updateNoteInCollection(
        noteModel, updatedNoteModel);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> loadNotes( ) {
    return firebaseRemoteDataSource.loadNotesFromCollection();
  }
}
