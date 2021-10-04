import 'package:notes/features/note/domain/entities/user_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository firebaseRepository;

  SignInUseCase({required this.firebaseRepository});

  Future<void> call(UserEntity user) async {
    return await firebaseRepository.signIn(user);
  }
}
