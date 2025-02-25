// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'PaymentPage.dart';
import 'home.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Plan")),
      body: Column(
        children: [
          ListTile(
            title: const Text("Free Plan"),
            onTap: () {
              // قم بفتح الامتحان المجاني
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("Paid Plan"),
            onTap: () {
              // قم بتوجيه المستخدم إلى صفحة الدفع
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
