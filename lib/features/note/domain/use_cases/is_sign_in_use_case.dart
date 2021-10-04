import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository firebaseRepository;

  IsSignInUseCase({required this.firebaseRepository});

  Future<bool> call() async {
    return await firebaseRepository.isSignIn();
  }
}
