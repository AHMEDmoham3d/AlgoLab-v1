// ignore_for_file: file_names

import 'Inheritance.dart';
import 'Constructor.dart'; // استيراد صفحة Constructor الجديدة
import 'package:flutter/material.dart';
import 'varibolcplasplas.dart';
import 'cout.dart';
import 'cin.dart';
import 'forcpls.dart';
import 'vector.dart';
import 'sort.dart';
import 'set.dart';
import 'string.dart';
import 'pair.dart';
import 'map.dart';
import 'class.dart';
import 'for_each.dart';
import 'Examc++1.dart'; // استيراد صفحة الامتحان

class CplsPlsTestPage extends StatelessWidget {
  const CplsPlsTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'C++ Programming Test',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              const Text(
                'C++  Select a Topic to Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Test your knowledge about C++ variables.\nClick the button below to begin!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              _buildStartButton(context),
              const SizedBox(height: 10),
              _buildCoutButton(context),
              const SizedBox(height: 10),
              _buildCinButton(context),
              const SizedBox(height: 10),
              _buildForLoopButton(context),
              const SizedBox(height: 10),
              _buildVectorButton(context),
              const SizedBox(height: 10),
              _buildSortButton(context),
              const SizedBox(height: 10),
              _buildSetButton(context),
              const SizedBox(height: 10),
              _buildStringButton(context),
              const SizedBox(height: 10),
              _buildPairButton(context),
              const SizedBox(height: 10),
              _buildMapButton(context),
              const SizedBox(height: 10),
              _buildClassButton(context),
              const SizedBox(height: 10),
              _buildInheritanceButton(context), // زر Inheritance
              const SizedBox(height: 10),
              _buildConstructorButton(context), // زر Constructor الجديد
              const SizedBox(height: 20),
              _buildForEachButton(context), // زر Constructor الجديد
              const SizedBox(height: 20),
              _buildExamButton(context), // زر Constructor الجديد
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return _buildButton(context, 'Start Variables Test', Colors.blue.shade50,
        () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VaribolCPlsPlsPage()),
      );
    });
  }

  Widget _buildCoutButton(BuildContext context) {
    return _buildButton(context, 'cout', Colors.green.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CoutPage()),
      );
    });
  }

  Widget _buildCinButton(BuildContext context) {
    return _buildButton(context, 'cin', Colors.orange.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CinPage()),
      );
    });
  }

  Widget _buildForLoopButton(BuildContext context) {
    return _buildButton(context, 'for loop', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForCPlsPage()),
      );
    });
  }

  Widget _buildVectorButton(BuildContext context) {
    return _buildButton(context, 'vector', Colors.red.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VectorPage()),
      );
    });
  }

  Widget _buildSortButton(BuildContext context) {
    return _buildButton(context, 'Sort', Colors.teal.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SortPage()),
      );
    });
  }

  Widget _buildSetButton(BuildContext context) {
    return _buildButton(context, 'Set', Colors.blueGrey.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SetPage()),
      );
    });
  }

  Widget _buildStringButton(BuildContext context) {
    return _buildButton(context, 'String', Colors.pink.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StringPage()),
      );
    });
  }

  Widget _buildPairButton(BuildContext context) {
    return _buildButton(context, 'Pair', Colors.lightGreen.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PairPage()),
      );
    });
  }

  Widget _buildMapButton(BuildContext context) {
    return _buildButton(context, 'Map', Colors.cyan.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MapPage()),
      );
    });
  }

  Widget _buildClassButton(BuildContext context) {
    return _buildButton(context, 'Class', Colors.amber.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ClassPage()),
      );
    });
  }

  Widget _buildInheritanceButton(BuildContext context) {
    return _buildButton(context, 'Inheritance', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InheritancePage()),
      );
    });
  }

  Widget _buildConstructorButton(BuildContext context) {
    return _buildButton(context, 'Constructor', Colors.deepOrange.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConstructorPage()),
      );
    });
  }

  Widget _buildForEachButton(BuildContext context) {
    return _buildButton(context, 'for_each', Colors.deepOrange.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForEachPage()),
      );
    });
  }

  Widget _buildExamButton(BuildContext context) {
    return _buildButton(context, 'Exam 1', Colors.red.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ExamCPlsPls1Page()),
      );
    });
  }

  Widget _buildButton(BuildContext context, String text, Color bgColor,
      VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            side: const BorderSide(color: Colors.blue),
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
