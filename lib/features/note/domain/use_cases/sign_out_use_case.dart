import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository firebaseRepository;

  SignOutUseCase({required this.firebaseRepository});

  Future<void> call() async {
    return await firebaseRepository.signOut();
  }
}
