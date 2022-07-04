import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../constant.dart';

class FirebaseAuthServices {
  static Future<bool> registerUser(
      {required String email, required String password}) async {
    // try {
    //   kFirebaseAuth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //   return true;
    // } on FirebaseAuthException catch (e) {
    //   log('Register ERROR==>>$e');
    // }

    kFirebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      print(e);
    });
    return true;
  }

  static Future<User?> loginUser(
      {required String email, required String password}) async {
    try {
      User? user = (await kFirebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        print("logIn Successfully");
        return user;
      } else {
        print("Login Faild");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future logOut() async {
    try {
      kFirebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      log('LogOut ERROR==>>$e');
    }
  }

  static Future deleteUser() async {
    try {
      kFirebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      log('delete ERROR==>>$e');
    }
  }

  static getCurrentUser() {
    log('Current User==>> ${kFirebaseAuth.currentUser!.email}');
    log('Current User==>> ${kFirebaseAuth.currentUser!.uid}');
    log('Current User==>> ${kFirebaseAuth.currentUser!.uid}');

    //kFirebaseAuth.currentUser?.delete();
  }
}
