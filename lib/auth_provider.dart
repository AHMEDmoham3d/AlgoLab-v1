// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthProvider extends ChangeNotifier {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   GoogleSignInAccount? _user;

//   GoogleSignInAccount? get user => _user;

//   Future<void> loginWithGoogle() async {
//     try {
//       _user = await _googleSignIn.signIn();
//       notifyListeners();
//     } catch (e) {
//       print('فشل تسجيل الدخول بحساب Google: $e');
//     }
//   }

//   Future<void> logout() async {
//     await _googleSignIn.signOut();
//     _user = null;
//     notifyListeners();
//   }
// }
