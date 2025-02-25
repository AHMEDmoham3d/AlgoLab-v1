import 'package:flutter/material.dart';
import 'home.dart'; // استيراد صفحة Home
import 'contact_screen.dart'; // استيراد صفحة Contact
import 'jsTestPage.dart'; // استيراد صفحة JavaScript
import 'c++tests/Cpls-pls.dart'; // استيراد صفحة C++ Programming
import 'c-tests/ctopic.dart'; // استيراد صفحة C Programming
import 'datastructtests/data-struct.dart'; // استيراد صفحة Data Structures

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LanguagesPageState createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  int _selectedIndex = 2; // جعل زر "Exam" هو المحدد عند فتح الصفحة

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ContactScreen(showAppBar: true),
        ),
      );
    }
    // لا تفعل شيئًا عند اختيار Exam لأنه الصفحة الحالية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Languages Page',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              'Select a Language to\nStart the Test',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLanguageButton(context, 'JavaScript'),
                  _buildLanguageButton(context, 'C++ Programming'),
                  _buildLanguageButton(context, 'C Programming'),
                  _buildLanguageButton(context, 'Data Structures'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blue.shade700,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), label: 'Contact'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Exam'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            side: const BorderSide(color: Colors.blue),
            backgroundColor: Colors.blue.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            if (text == 'JavaScript') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JsTestPage()),
              );
            } else if (text == 'C++ Programming') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CplsPlsTestPage()),
              );
            } else if (text == 'C Programming') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CTopicPage()),
              );
            } else if (text == 'Data Structures') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DataStructuresTestPage()),
              );
            }
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
