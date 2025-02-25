import 'package:flutter/material.dart';
import 'Octal-c.dart';
import 'ascii-c.dart';
import 'bitwiseOperatorXOr.dart';
import 'bitwiseoperatorLeftShift.dart';
import 'bitwiseoperatorRightShift.dart';
import 'enum-c.dart';
import 'pointer-C.dart';
import 'printf.dart';
import 'typedef-c.dart';
import 'variables-c.dart';
import 'scanf.dart';
import 'if-c.dart';
import 'for-c.dart';
import 'while-c.dart';
import 'dowhile-c.dart';
import 'switch-c.dart';
import 'array-c.dart';
import 'function-c.dart';
import 'binary-c.dart';
import 'hexadecimal-c.dart';
import 'string-c.dart';
import 'struct-c.dart';
import 'bitwiseOperatorAND.dart';
import 'bitwiseOperatorNot.dart';
import 'bitwiseOperatorOR.dart';
import 'exam-c1.dart';

class CTopicPage extends StatelessWidget {
  const CTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'C Programming Test',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // يضيف تأثير تمرير سلس
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'C Select a Topic to Test',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildStartButton(context, 'Printf', Colors.blue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrintfPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Variables', Colors.green.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VariablesCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Scanf', Colors.orange.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScanfPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'If Statement', Colors.purple.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IfCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'For Loop', Colors.red.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'While Loop', Colors.teal.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WhileCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'Do While Loop', Colors.deepPurple.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoWhileCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'Switch Statement', Colors.cyan.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SwitchCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Array', Colors.blueGrey.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArrayCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Function', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FunctionCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Binary', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BinaryCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Octal', Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OctalCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'hexadecimal', Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HexadecimalCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'ASCII', Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ASCIICPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'String', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StringCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Struct', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StructCPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'Bitwise Operator AND', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const bitwiseOperatorANDPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'Bitwise Operator Or', Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const bitwiseOperatorORPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'Bitwise Operator Not', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BitwiseOperatorNotPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(
                  context, 'Bitwise Operator XOr', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BitwiseOperatXorNotPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'pointer', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PointerPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Bitwiseo perator Left Shift',
                  Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const BitwiseoperatorLeftShiftPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Bitwiseo perator Right  Shift',
                  Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const BitwiseoperatorRightShiftPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Enum', Colors.lightBlue.shade50, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EnumtPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'typedef', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TypedefPage()),
                );
              }),
              const SizedBox(height: 10),
              _buildStartButton(context, 'Exam 1', Colors.lightBlue.shade50,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Exam1cPage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context, String text, Color bgColor,
      VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
