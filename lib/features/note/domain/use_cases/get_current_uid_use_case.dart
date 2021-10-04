import 'package:notes/features/note/domain/repositories/firebase_repository.dart';

class GetCurrentUidUseCase {
  final FirebaseRepository firebaseRepository;

  GetCurrentUidUseCase({required this.firebaseRepository});

  Future<String> call() async {
    return await firebaseRepository.getCurrentUid();
  }
}
