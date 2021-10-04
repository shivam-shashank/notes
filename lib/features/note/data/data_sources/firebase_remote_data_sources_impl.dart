import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/features/note/data/data_sources/firebase_remote_data_sources.dart';
import 'package:notes/features/note/data/models/note_model.dart';
import 'package:notes/features/note/data/models/user_model.dart';
import 'package:notes/features/note/domain/entities/note_entity.dart';
import 'package:notes/features/note/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourcesImpl implements FirebaseRemoteDataSources {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  FirebaseRemoteDataSourcesImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<void> addNewNote(NoteEntity noteEntity) async {
    final noteCollectionRef = firebaseFirestore
        .collection("users")
        .doc(noteEntity.uid)
        .collection("notes");

    final noteId = noteCollectionRef.doc().id;

    noteCollectionRef.doc(noteId).get().then((note) {
      final newNote = NoteModel(
        uid: noteEntity.uid,
        noteId: noteId,
        note: noteEntity.note,
        timestamp: noteEntity.timestamp,
      ).toDocument();

      if (!note.exists) {
        noteCollectionRef.doc(noteId).set(newNote);
      }
      return;
    });
  }

  @override
  Future<void> deleteNote(NoteEntity noteEntity) async {
    final noteCollectionRef = firebaseFirestore
        .collection("users")
        .doc(noteEntity.uid)
        .collection("notes");

    noteCollectionRef.doc(noteEntity.noteId).get().then((note) {
      if (note.exists) {
        noteCollectionRef.doc(noteEntity.noteId).delete();
      }
      return;
    });
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollectionRef = firebaseFirestore.collection("users");
    final uid = await getCurrentUid();
    userCollectionRef.doc(uid).get().then((value) {
      final newUser = UserModel(
        uid: uid,
        status: user.status,
        email: user.email,
        name: user.name,
      ).toDocument();
      if (!value.exists) {
        userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Stream<List<NoteEntity>> getNotes(String uid) {
    final noteCollectionRef =
        firebaseFirestore.collection("users").doc(uid).collection("notes");

    return noteCollectionRef.snapshots().map((querySnap) {
      return querySnap.docs
          .map((docSnap) => NoteModel.fromSnapshot(docSnap))
          .toList();
    });
  }

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async => firebaseAuth
      .signInWithEmailAndPassword(email: user.email!, password: user.password!);

  @override
  Future<void> signOut() async => firebaseAuth.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      firebaseAuth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

  @override
  Future<void> updateNote(NoteEntity note) async {
    Map<String, dynamic> noteMap = {};
    final noteCollectionRef =
        firebaseFirestore.collection("users").doc(note.uid).collection("notes");

    if (note.note != null) noteMap['note'] = note.note;
    if (note.timestamp != null) noteMap['time'] = note.timestamp;

    noteCollectionRef.doc(note.noteId).update(noteMap);
  }
}
