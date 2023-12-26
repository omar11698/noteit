import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/config/Dependency_injection/DI.dart';
import '../../../../domain/entities/note_entity.dart';
import '../../../../domain/use_cases/add_note_usecase.dart';
import '../../../../domain/use_cases/delete_note_usecase.dart';
import '../../../../domain/use_cases/load_notes_usecase.dart';
import '../../../../domain/use_cases/update_note_usecase.dart';

part 'gridviewbloc_event.dart';
part 'gridviewbloc_state.dart';

class GridViewBloc extends Bloc<GridviewEvent, GridviewState> {



  GridViewBloc() : super(NotesInitial()) {

    on<LoadNotes>((event, emit) async => await _handleLoadNotes(event, emit));
    on<AddNote>((event, emit) async => await _handleAddNote(event, emit));
    on<DeleteNote>((event, emit) async => await _handleDeleteNote(event, emit));
    on<UpdateNote>((event, emit) async => await _handleUpdateNote(event, emit));

  }

  _handleLoadNotes(GridviewEvent event, Emitter<GridviewState> emit) async {
    final loadNotesUseCase=LoadNotesUseCase(repository: instance());
    try {
      var firebaseStream = loadNotesUseCase.execute();
      emit(NotesLoaded(streamFirebase: firebaseStream));
    }
    on FirebaseException catch (e){
      debugPrint(e.message);
    }

  }

  _handleAddNote(AddNote event, Emitter<GridviewState> emit)  async {
    final addNotesUseCase=AddNoteUseCase(repository: instance());
    try{
     await addNotesUseCase.execute(event.note);
      emit(NotesInitial());
    }
    on FirebaseException catch (e){
      emit(ErrorLoadingNotes(message: e.message.toString()));
    }

  }

  _handleDeleteNote(DeleteNote event, Emitter<GridviewState> emit) async {
    try{
      final deleteNoteUseCase=DeleteNoteUseCase(repository: instance());
      await deleteNoteUseCase.execute(event.note);
      emit(NotesInitial());
    }
    on FirebaseException catch (e){
      emit(ErrorLoadingNotes(message: e.message.toString()));
    }
  }

  _handleUpdateNote(UpdateNote event, Emitter<GridviewState> emit) async {

    try{
      final updateNoteUseCase=UpdateNoteUseCase(repository: instance());
      await updateNoteUseCase.execute(note:event.note,updatedNote:event.newNote);
      emit(NotesInitial());
    }
    on FirebaseException catch (e){
      emit(ErrorLoadingNotes(message: e.message.toString()));
    }
  }


}
