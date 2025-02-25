// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});

//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _register() async {
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       User? user = userCredential.user;
//       if (user != null) {
//         await user.updateDisplayName(_nameController.text.trim());
//         await user.reload();
//         user = _auth.currentUser;

//         if (user != null) {
//           await _firestore.collection("users").doc(user.uid).set({
//             "name": _nameController.text.trim(),
//             "email": _emailController.text.trim(),
//             "createdAt": DateTime.now(),
//           });

//           // ✅ حفظ حالة التسجيل
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.setBool('isRegistered', true);

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 content: Text("✅ Welcome, ${user.displayName ?? 'User'}!")),
//           );

//           Navigator.pushReplacementNamed(context, '/home');
//         }
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("❌ Registration failed: ${e.toString()}")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             const Text("Registration", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         elevation: 4,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Full Name',
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                 prefixIcon: const Icon(Icons.person, color: Colors.blue),
//               ),
//             ),
//             const SizedBox(height: 15),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                 prefixIcon: const Icon(Icons.email, color: Colors.blue),
//               ),
//             ),
//             const SizedBox(height: 15),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                 prefixIcon: const Icon(Icons.lock, color: Colors.blue),
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _register,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   elevation: 5,
//                 ),
//                 child: const Text("Register",
//                     style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
