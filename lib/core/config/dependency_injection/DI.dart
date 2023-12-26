import 'package:get_it/get_it.dart';
import 'package:noteit/Note_feature/domain/use_cases/delete_note_usecase.dart';
import 'package:noteit/Note_feature/domain/use_cases/update_note_usecase.dart';

import '../../../Note_feature/data/remote/data_sources/Firebase.dart';
import '../../../Note_feature/data/repositories/repository_impl.dart';
import '../../../Note_feature/domain/repositories/repository.dart';
import '../../../Note_feature/domain/use_cases/add_note_usecase.dart';
import '../../../Note_feature/domain/use_cases/load_notes_usecase.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule()async{

  // remote data source
  instance.registerLazySingleton<FirebaseRemoteDataSource>(() =>FirebaseRemoteDataSource());

  // repository
  instance.registerLazySingleton<NoteRepository>(() =>NoteRepositoryImpl(firebaseRemoteDataSource: instance(),));


}



/// for use case
Future<void> initNoteModule() async{

    if (!GetIt.I.isRegistered<AddNoteUseCase>()) {
      instance
               .registerFactory<AddNoteUseCase>(() => AddNoteUseCase(repository:instance()));
      instance
          .registerFactory<DeleteNoteUseCase>(() => DeleteNoteUseCase(repository:instance()));
      instance
          .registerFactory<UpdateNoteUseCase>(() => UpdateNoteUseCase(repository:instance()));
      // instance
      instance
              .registerFactory<LoadNotesUseCase>(() => LoadNotesUseCase(repository:instance()));
          // instance
      //     .registerFactory<GetNotesBloc>(() => GetNotesBloc(getWeatherByCityName:instance()));
    }



}

