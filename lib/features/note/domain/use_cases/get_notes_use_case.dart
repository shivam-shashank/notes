import 'package:notes/features/note/domain/entities/note_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class GetNotesUseCase {
  final FirebaseRepository firebaseRepository;

  GetNotesUseCase({required this.firebaseRepository});

  Stream<List<NoteEntity>> call(String uid) {
    return firebaseRepository.getNotes(uid);
  }
}
