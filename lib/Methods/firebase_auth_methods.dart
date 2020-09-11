import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ful2fun/Home/home_page.dart';
import 'package:ful2fun/SignInSignUp/signin_signup.dart';

class AuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  phoneNumberVerification(String phoneNumber, BuildContext context) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (vid, resentToken) async {
          String code = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(),
            ),
          );
          PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(verificationId: vid, smsCode: code);

          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }

          // Handle other errors
        },
        timeout: const Duration(seconds: 5),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
