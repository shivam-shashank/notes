import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/features/note/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? uid,
    final String? status,
    final String? password,
  }) : super(
          name: name,
          email: email,
          uid: uid,
          status: status,
          password: password,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      name: documentSnapshot.get('name'),
      email: documentSnapshot.get('email'),
      uid: documentSnapshot.get('uid'),
      status: documentSnapshot.get('status'),
      password: documentSnapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "status": status,
      "password": password,
    };
  }
}
