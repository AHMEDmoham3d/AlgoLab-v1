// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Column(
        children: [
          ListTile(
            title: const Text("Pay with Instapay"),
            onTap: () {
              // قم بإتمام الدفع عبر Instapay
            },
          ),
          ListTile(
            title: const Text("Pay with Vodafone Cash"),
            onTap: () {
              // قم بإتمام الدفع عبر Vodafone Cash
            },
          ),
        ],
      ),
    );
  }
}
