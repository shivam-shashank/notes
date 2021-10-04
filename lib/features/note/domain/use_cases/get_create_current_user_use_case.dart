import 'package:notes/features/note/domain/entities/user_entity.dart';
import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository firebaseRepository;

  GetCreateCurrentUserUseCase({required this.firebaseRepository});

  Future<void> call(UserEntity user) async {
    return await firebaseRepository.getCreateCurrentUser(user);
  }
}
