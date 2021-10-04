import 'package:notes/features/note/domain/entities/note_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class UpdateNoteUseCase {
  final FirebaseRepository firebaseRepository;

  UpdateNoteUseCase({required this.firebaseRepository});

  Future<void> call(NoteEntity note) async {
    return await firebaseRepository.updateNote(note);
  }
}
