// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'home.dart';
// import 'login.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(
//           context, '/login'); // ينتقل إلى صفحة تسجيل الدخول
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             CircularProgressIndicator(),
//             SizedBox(height: 20),
//             Text('loding..', style: TextStyle(fontSize: 20)),
//           ],
//         ),
//       ),
//     );
//   }
// }
