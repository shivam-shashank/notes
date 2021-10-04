import 'package:notes/features/note/domain/entities/user_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository firebaseRepository;

  SignUpUseCase({required this.firebaseRepository});

  Future<void> call(UserEntity user) async {
    return await firebaseRepository.signUp(user);
  }
}
