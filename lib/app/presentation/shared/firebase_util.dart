import 'package:autentification/app/domain/models/user_model.dart'
    show UserModel;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveUserToFirestore(UserModel user) async {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  await usersCollection.doc(user.id).set(user.toJson());
}

Future<UserModel?> getUserFromFirestore(String userId) async {
  final doc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
  if (doc.exists) {
    return UserModel.fromJson(doc.data()!);
  }
  return null;
}

Future<void> updateUserInFirestore(UserModel user) async {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  await usersCollection.doc(user.id).update(user.toJson());
}

Future<void> deleteUserFromFirestore(String userId) async {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  await usersCollection.doc(userId).delete();
}

Future<void> saveImageToFirestore(String userId, String imageUrl) async {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  await usersCollection.doc(userId).update({
    'profileImage': imageUrl,
  });
}

Future<String?> getImageFromFirestore(String userId) async {
  final doc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
  if (doc.exists) {
    return doc.data()?['profileImage'] as String?;
  }
  return null;
}
