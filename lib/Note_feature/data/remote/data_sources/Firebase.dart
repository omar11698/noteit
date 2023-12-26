
import 'package:flutter/cupertino.dart';
import '../../../domain/entities/note_entity.dart';
import '../../repositories/repository_impl.dart';
import '../models/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


abstract class FirebaseRemoteDataSourceContract {

  Future<void> addNoteToCollection(NoteModel noteModel);
  Future<void> updateNoteInCollection(NoteModel noteModel,NoteModel updatedNoteModel);
  Future<void> deleteNoteFromCollection(NoteModel noteModel);
  Stream<QuerySnapshot<Map<String, dynamic>>> loadNotesFromCollection();

}




class FirebaseRemoteDataSource extends FirebaseRemoteDataSourceContract{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;



  @override
  Future<void> addNoteToCollection(NoteModel noteModel) async {
    final thisNote=noteModel.toJson();
    final noteUniqueIdTimeDate=thisNote['dateTime'];
    final CollectionReference notesCollection =  firestore.collection('notes');

    try{

      await notesCollection.doc(noteUniqueIdTimeDate).set(thisNote).then((value) => print('The note is added successfully'));

    }

    on FirebaseException catch (error)  {
      debugPrint("Failed Deleting the note and the reason is  this error:${error.message}");
    }


  }





  @override
  Future<void> updateNoteInCollection(NoteModel noteModel,NoteModel updatedNoteModel) async {
    final thisNote=noteModel.toJson();

    final noteUniqueIdTimeDate=thisNote['dateTime'];
    final changeToThisNote=updatedNoteModel.toJson();

    final CollectionReference notesCollection =  firestore.collection('notes');

    try{

      await notesCollection.doc(noteUniqueIdTimeDate).get().then((note) async{
        if(note.exists){
          await notesCollection.doc(noteUniqueIdTimeDate).update(changeToThisNote).then((value) => debugPrint('The note is updated successfully'));
        }
        return;
      });

    }
    on FirebaseException catch (error)  {
      debugPrint("Failed updating the note and the reason is  this error:${error.message}");
    }

  }






  @override
  Future<void> deleteNoteFromCollection(NoteModel noteModel) async{
    final thisNote=noteModel.toJson();
    final noteUniqueIdTimeDate=thisNote['dateTime'];
    final CollectionReference notesCollection =  firestore.collection('notes');

    try{

      await notesCollection.doc(noteUniqueIdTimeDate).get().then((note) async{

        if(note.exists){
        await notesCollection.doc(noteUniqueIdTimeDate).delete().then((value) => debugPrint('The note is deleted successfully'));
        }
        return;
      });


    }

    on FirebaseException catch (error)  {
      debugPrint("Failed Deleting the note and the reason is  this error:${error.message}");
    }


  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> loadNotesFromCollection() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> streamFirebase =FirebaseFirestore.instance.collection('notes').snapshots();
    return streamFirebase;
  }





}