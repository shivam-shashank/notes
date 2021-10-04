import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/features/note/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    final String? noteId,
    final String? note,
    final Timestamp? timestamp,
    final String? uid,
  }) : super(
          noteId: noteId,
          note: note,
          timestamp: timestamp,
          uid: uid,
        );

  factory NoteModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return NoteModel(
      noteId: documentSnapshot.get('noteId'),
      note: documentSnapshot.get('note'),
      timestamp: documentSnapshot.get('timestamp'),
      uid: documentSnapshot.get('uid'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "noteId": noteId,
      "note": note,
      "timestamp": timestamp,
      "uid": uid,
    };
  }
}
