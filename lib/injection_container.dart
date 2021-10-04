import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/features/note/data/data_sources/firebase_remote_data_sources.dart';
import 'package:notes/features/note/data/data_sources/firebase_remote_data_sources_impl.dart';
import 'package:notes/features/note/domain/use_cases/get_create_current_user_use_case.dart';

import 'features/note/data/repositories/firebase_repository_impl.dart';
import 'features/note/domain/repositories/firebase_repository.dart';
import 'features/note/domain/use_cases/add_new_note_use_case.dart';
import 'features/note/domain/use_cases/delete_note_use_case.dart';
import 'features/note/domain/use_cases/get_current_uid_use_case.dart';
import 'features/note/domain/use_cases/get_notes_use_case.dart';
import 'features/note/domain/use_cases/is_sign_in_use_case.dart';
import 'features/note/domain/use_cases/sign_in_use_case.dart';
import 'features/note/domain/use_cases/sign_out_use_case.dart';
import 'features/note/domain/use_cases/sign_up_use_case.dart';
import 'features/note/domain/use_cases/update_note_use_case.dart';
import 'features/note/presentation/cubit/auth/auth_cubit.dart';
import 'features/note/presentation/cubit/note/note_cubit.dart';
import 'features/note/presentation/cubit/user/user_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Cubit/Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
        getCreateCurrentUserUseCase: sl.call(),
        signInUseCase: sl.call(),
        signUPUseCase: sl.call(),
      ));
  sl.registerFactory<NoteCubit>(() => NoteCubit(
        updateNoteUseCase: sl.call(),
        getNotesUseCase: sl.call(),
        deleteNoteUseCase: sl.call(),
        addNewNoteUseCase: sl.call(),
      ));

  //useCase
  sl.registerLazySingleton<AddNewNoteUseCase>(
      () => AddNewNoteUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<DeleteNoteUseCase>(
      () => DeleteNoteUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<GetNotesUseCase>(
      () => GetNotesUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton<UpdateNoteUseCase>(
      () => UpdateNoteUseCase(firebaseRepository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDataSources: sl.call()));

  //data source
  sl.registerLazySingleton<FirebaseRemoteDataSources>(
    () => FirebaseRemoteDataSourcesImpl(
      firebaseAuth: sl.call(),
      firebaseFirestore: sl.call(),
    ),
  );

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
