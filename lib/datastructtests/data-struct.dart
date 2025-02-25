// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Recursion2.dart';
import 'recursion.dart'; // استيراد صفحة Recursion
import 'Fibonacci.dart'; // استيراد صفحة Fibonacci
import 'malloc.dart'; // استيراد صفحة malloc
import 'Calloc.dart'; // استيراد صفحة malloc
import 'realloc.dart'; // استيراد صفحة malloc
import 'linkedlist.dart'; // استيراد صفحة malloc
import 'linkedaddfirst.dart'; // استيراد صفحة malloc
import 'linkedaddend.dart'; // استيراد صفحة malloc
import 'delet-ds.dart'; // استيراد صفحة malloc
import 'Double-ds.dart'; // استيراد صفحة malloc
import 'stack-ds.dart'; // استيراد صفحة malloc
import 'Queue-ds.dart'; // استيراد صفحة malloc
import 'deque-ds.dart'; // استيراد صفحة malloc
import 'list.dart'; // استيراد صفحة malloc
import 'tree.dart'; // استيراد صفحة malloc
import 'binarySearchtree.dart'; // استيراد صفحة malloc
import 'Heap.dart'; // استيراد صفحة malloc
import 'Hashing.dart'; // استيراد صفحة malloc

class DataStructuresTestPage extends StatelessWidget {
  const DataStructuresTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Data Structures Test',
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
                'Data Structures Select a Topic to Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Test your knowledge about Data Structures.\nClick the button below to begin!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 10),
              // إضافة زر Recursion
              _buildRecursionButton(context),
              const SizedBox(height: 10),
              // إضافة زر Recursion Part 2
              _buildRecursionPart2Button(context),
              const SizedBox(height: 10),
              // إضافة زر Fibonacci
              _buildFibonacciButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildMallocButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildCallocButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildreallocButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildlinkedlistButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildlinkedlisaddfirsttButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildlinkedlisaddendtButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _builddelettButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildDoubletButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildStackButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildQueueButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildDequeButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildlistButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildtreeButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildbinarySearchtreeButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildHeapButton(context),
              const SizedBox(height: 10),
              // إضافة زر malloc
              _buildHashingButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لإنشاء زر Recursion
  Widget _buildRecursionButton(BuildContext context) {
    return _buildButton(context, 'Recursion', Colors.green.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RecursionPage()),
      );
    });
  }

  // دالة لإنشاء زر Recursion Part 2
  Widget _buildRecursionPart2Button(BuildContext context) {
    return _buildButton(context, 'Recursion part 2', Colors.green.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Recursion2Page()),
      );
    });
  }

  // دالة لإنشاء زر Fibonacci
  Widget _buildFibonacciButton(BuildContext context) {
    return _buildButton(context, 'Fibonacci', Colors.orange.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FibonacciPage()),
      );
    });
  }

  // دالة لإنشاء زر malloc
  Widget _buildMallocButton(BuildContext context) {
    return _buildButton(context, 'malloc', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MallocPage()),
      );
    });
  }

  Widget _buildCallocButton(BuildContext context) {
    return _buildButton(context, 'Calloc', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CallocPage()),
      );
    });
  }

  Widget _buildreallocButton(BuildContext context) {
    return _buildButton(context, 'Realloc', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReallocPage()),
      );
    });
  }

  Widget _buildlinkedlistButton(BuildContext context) {
    return _buildButton(context, 'linked list', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LinkedListPage()),
      );
    });
  }

  Widget _buildlinkedlisaddfirsttButton(BuildContext context) {
    return _buildButton(context, 'linked list add first', Colors.purple.shade50,
        () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LinkedListAddFirstPage()),
      );
    });
  }

  Widget _buildlinkedlisaddendtButton(BuildContext context) {
    return _buildButton(context, 'last linked list', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LinkedListAddendtPage()),
      );
    });
  }

  Widget _builddelettButton(BuildContext context) {
    return _buildButton(context, ' Delet linked list', Colors.purple.shade50,
        () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DelettPage()),
      );
    });
  }

  Widget _buildDoubletButton(BuildContext context) {
    return _buildButton(context, 'Double linked list', Colors.purple.shade50,
        () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoubletPagePage()),
      );
    });
  }

  Widget _buildStackButton(BuildContext context) {
    return _buildButton(context, 'Stack', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StackPage()),
      );
    });
  }

  Widget _buildQueueButton(BuildContext context) {
    return _buildButton(context, 'Queue', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QueuePage()),
      );
    });
  }

  Widget _buildDequeButton(BuildContext context) {
    return _buildButton(context, 'Deque', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DequePage()),
      );
    });
  }

  Widget _buildlistButton(BuildContext context) {
    return _buildButton(context, 'list', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListPage()),
      );
    });
  }

  Widget _buildtreeButton(BuildContext context) {
    return _buildButton(context, 'Tree', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TreePage()),
      );
    });
  }

  Widget _buildbinarySearchtreeButton(BuildContext context) {
    return _buildButton(context, 'binary Search tree', Colors.purple.shade50,
        () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BinarySearchTreePage()),
      );
    });
  }

  Widget _buildHeapButton(BuildContext context) {
    return _buildButton(context, 'Heap', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HeapPage()),
      );
    });
  }

  Widget _buildHashingButton(BuildContext context) {
    return _buildButton(context, 'Hashing', Colors.purple.shade50, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HashingPage()),
      );
    });
  }

  // دالة لإنشاء الزر المشترك
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

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Questions'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Test content will appear here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
