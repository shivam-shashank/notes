import 'package:notes/features/note/domain/entities/note_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class DeleteNoteUseCase {
  final FirebaseRepository firebaseRepository;

  DeleteNoteUseCase({required this.firebaseRepository});

  Future<void> call(NoteEntity noteEntity) async {
    return await firebaseRepository.deleteNote(noteEntity);
  }
}
