// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:provider/provider.dart';
// import 'auth_provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final SupabaseClient client = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     checkIfLoggedIn();
//   }

//   // ✅ التحقق إذا كان المستخدم مسجل الدخول
//   void checkIfLoggedIn() async {
//     final user = client.auth.currentUser;
//     if (user != null) {
//       Navigator.pushReplacementNamed(context, '/home');
//     }
//   }

//   // ✅ تسجيل الدخول باستخدام GitHub
// Future<void> signInWithGitHub() async {
//   try {
//     await Supabase.instance.client.auth.signInWithOAuth(
//       OAuthProvider.github,
//       redirectTo: 'https://fmaarceubaythehqfaka.supabase.co/auth/v1/callback',
//     );

//     // استماع لتغير حالة المصادقة
//     Supabase.instance.client.auth.onAuthStateChange.listen((data) {
//       final session = data.session;
//       if (session != null) {
//         Navigator.pushReplacementNamed(context, '/home');
//       }
//     });
//   } catch (e) {
//     showMessage('خطأ أثناء تسجيل الدخول باستخدام GitHub: $e');
//   }
// }


//   // 🔔 عرض رسالة خطأ
//   void showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("تسجيل الدخول باستخدام GitHub")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: signInWithGitHub,
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//           child: const Text('تسجيل الدخول باستخدام GitHub'),
//         ),
//       ),
//     );
//   }
// }
