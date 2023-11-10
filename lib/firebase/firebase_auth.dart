// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void signUp(
      String name,
      String email,
      String password,
      String passwordConfirm,
      Function onSuccess,
      Function(String) onRegisterError) async {
    try {
      UserCredential result = await _fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _firebaseFirestore
          .collection('users')
          .doc(result.user!.uid)
          .set({'uid': result.user!.uid, 'email': email});
    } catch (err) {
      // ignore: prefer_interpolation_to_compose_strings
      print("err: " + err.toString());
      _onSignupErr(err.toString(), onRegisterError);
    }
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      // ignore: prefer_interpolation_to_compose_strings
      print("err: " + err.toString());
      onSignInError("Sign-In fail, please try again");
    });
  }

  void _onSignupErr(String code, Function(String) onRegisterError) {
    print(code);
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDETIAL":
        onRegisterError('Invalid email');
        break;
      case "ERROR_EMAIL_ALREADY_EXIST":
        onRegisterError('Email already exists');
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError('The password is not strong enough!');
        break;
      default:
        onRegisterError('Signup fail, please try again!');
        break;
    }
  }
}
