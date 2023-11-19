// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/features/auth/screens/otp_screen.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) async {
          auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(context, OTPScreen.routeName,
              arguments: verificationId);
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        content: e.message!,
        context: context,
      );
    }
  }
}
