import 'package:notes/features/note/domain/entities/note_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class AddNewNoteUseCase {
  final FirebaseRepository firebaseRepository;

  AddNewNoteUseCase({required this.firebaseRepository});

  Future<void> call(NoteEntity note) async {
    return await firebaseRepository.addNewNote(note);
  }
}
