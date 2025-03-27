/*implementación para acceder a API, sigIn, signOut, getUser, delete, userExist, etc
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../domain/models/user_model.dart';
import '../controllers/auth_controller.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl();

  //@override
  //User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<UserModel?> signIn(String email, String password) async {
    try {
      final credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credentials.user == null) {
        return null;
      }
      /* para recuperar los datos de firebaseStore, luego habra que cambiar el return por el userModel
      final doc = await FirebaseFirestore.instance
          .collection('users') 
          .doc(credentials.user!.uid)
          .get();
      if (!doc.exists) {
        return null;
      }
       final userModel = UserModel.fromJson(doc.data()!);

          */

      return null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return null;
    } catch (e) {
      debugPrint(e.toString as String?);
      return null;
    }
  }

  @override
  Future<UserModel?> register({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credentials.user == null) {
        return null;
      }

      final newUser = UserModel(
        id: credentials.user!.uid,
        email: email,
        firstName: email.split('@').first,
        createdAt: DateTime.now(),
      );
/* esto para guardar en FIRESTORE
      await FirebaseFirestore.instance
          .collection(Collections.users)
          .doc(credentials.user!.uid)
          .set(
            userToCreate.toJson(),
          );*/

      return newUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserModel?> getUser(String userId) async {
    /*try {
      final doc = await FirebaseFirestore.instance
          .collection(Collections.users)
          .doc(userId)
          .get();
      if (doc.data() == null) return null;
      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      debugPrint(e.toString());
      */
    final newUser = UserModel(
      id: "1",
      email: "email@gmail.com",
      firstName: "silvia",
      createdAt: DateTime.now(),
    );
    return newUser;
  }

/*
  @override
  Future<FirebaseResponse> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const FirebaseResponse.success();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return e.code.toFirebaseResponse();
    } catch (e) {
      debugPrint(e.toString());
      return FirebaseResponse.undefined(message: e.toString());
    }
  }

  //Delte user account ---------------------------------------------
  @override
  Future<FirebaseResponse> deleteUserAccount(String password) async {
    if (currentUser == null) return const FirebaseResponse.noCredentials();
    try {
      await currentUser!.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: currentUser!.email!,
          password: password,
        ),
      );
      final result = await _deleteFirestoreUser(currentUser!.uid);
      if (result == const FirebaseResponse.success()) {
        await currentUser!.delete();
        return const FirebaseResponse.success();
      }
      return result;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return e.code.toFirebaseResponse();
    } catch (e) {
      debugPrint(e.toString());
      return FirebaseResponse.undefined(message: e.toString());
    }
  }

  Future<FirebaseResponse> _deleteFirestoreUser(String userId) async {
    try {
      final usersCollection =
          FirebaseFirestore.instance.collection(Collections.users);
      DocumentReference docRef = usersCollection.doc(userId);
      await docRef.delete();
      return const FirebaseResponse.success();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.code.toFirebaseResponse();
    }
  }

  @override
  Future<bool> userExists(String email) async {
    try {
      final usersCollection =
          FirebaseFirestore.instance.collection(Collections.users);
      final docs = await usersCollection.where('email', isEqualTo: email).get();
      return docs.docs.isNotEmpty;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  @override
  Future<FirebaseResponse> updateUserInfo(UserModel user) async {
    try {
      final usersCollection =
          FirebaseFirestore.instance.collection(Collections.users);
      await usersCollection.doc(user.id).update(
            user.toJson(),
          );
      return const FirebaseResponse.success();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.code.toFirebaseResponse();
    }
  }
} */
}
