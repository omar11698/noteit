import '../../data/remote/models/note_model.dart';
import '../entities/note_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NoteRepository{

Future<void>  addNote(Note note);
Future<void>  updateNote(Note note,Note updatedNote);
Future<void>  deleteNote(Note note);
Stream<QuerySnapshot<Map<String, dynamic>>> loadNotes();

}