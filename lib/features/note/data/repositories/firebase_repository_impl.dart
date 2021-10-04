import 'package:notes/features/note/data/data_sources/firebase_remote_data_sources.dart';
import 'package:notes/features/note/domain/entities/note_entity.dart';
import 'package:notes/features/note/domain/entities/user_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDataSources firebaseRemoteDataSources;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSources});

  @override
  Future<void> addNewNote(NoteEntity noteEntity) async =>
      firebaseRemoteDataSources.addNewNote(noteEntity);

  @override
  Future<void> deleteNote(NoteEntity noteEntity) async =>
      firebaseRemoteDataSources.deleteNote(noteEntity);

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) async =>
      firebaseRemoteDataSources.getCreateCurrentUser(userEntity);

  @override
  Future<String> getCurrentUid() async =>
      firebaseRemoteDataSources.getCurrentUid();

  @override
  Stream<List<NoteEntity>> getNotes(String uid) =>
      firebaseRemoteDataSources.getNotes(uid);

  @override
  Future<bool> isSignIn() async => firebaseRemoteDataSources.isSignIn();

  @override
  Future<void> signIn(UserEntity userEntity) async =>
      firebaseRemoteDataSources.signIn(userEntity);

  @override
  Future<void> signOut() async => firebaseRemoteDataSources.signOut();

  @override
  Future<void> signUp(UserEntity userEntity) async =>
      firebaseRemoteDataSources.signUp(userEntity);

  @override
  Future<void> updateNote(NoteEntity noteEntity) async =>
      firebaseRemoteDataSources.updateNote(noteEntity);
}
