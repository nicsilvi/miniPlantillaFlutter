import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/user_model.dart';
import '../implements/authentication_impl.dart';

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => AuthenticationRepositoryImpl(),
);

abstract class AuthenticationRepository {
  Future<UserModel?> signIn(
    String email,
    String password,
  );

  Future<UserModel?> register({
    required String email,
    required String name,
    required String password,
  });

  Future<bool> signOut();
  Future<UserModel?> getUser(String userId);

  // Definir el estado de autenticación

  //Future<UserModel?> getUser(String userId);
  //User? get currentUser;
  //Future<FirebaseResponse> sendPasswordResetEmail(String email);
  //Future<FirebaseResponse> deleteUserAccount(String password);

  //Future<bool> userExists(String email);

  //Future<FirebaseResponse> updateUserInfo(UserModel user);
}
