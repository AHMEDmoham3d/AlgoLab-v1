// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:algo_v1/js-topic/varibols_test.dart';
import 'package:algo_v1/js-topic/console_test_page.dart';
import 'package:algo_v1/js-topic/DataTypesTest.dart';
import 'package:algo_v1/js-topic/identifiersTest.dart';
import 'package:algo_v1/js-topic/let_const_var_test.dart';
import 'package:algo_v1/js-topic/concat.dart';
import 'package:algo_v1/js-topic/TemplateLiteralsTestPage.dart';
import 'package:algo_v1/js-topic/ArithmeticOperators.dart';
import 'package:algo_v1/js-topic/UnaryOperatorsPage.dart';
import 'package:algo_v1/js-topic/mathObject.dart';
import 'package:algo_v1/js-topic/stringMethods.dart';
import 'package:algo_v1/js-topic/IfConditions.dart';
import 'package:algo_v1/js-topic/for.dart';
import 'package:algo_v1/js-topic/while.dart';
import 'package:algo_v1/js-topic/doWhile.dart';
import 'package:algo_v1/js-topic/switch.dart';
import 'package:algo_v1/js-topic/map.dart';
import 'package:algo_v1/js-topic/filter.dart';

class JsTestPage extends StatelessWidget {
  const JsTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'JavaScript Topics',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              const Text(
                'Select a Topic to Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              _buildLanguageButton(context, 'Variables & Data Types'),
              _buildTopicButton(context, 'Let, Const & Var'),
              _buildTopicButton(context, 'Data Types Test'),
              _buildTopicButton(context, 'Identifiers'),
              _buildTopicButton(context, 'Concat'),
              _buildTopicButton(context, 'Template Literals'),
              _buildTopicButton(context, 'Arithmetic Operators'),
              _buildTopicButton(context, 'Unary Plus And Negation Operator'),
              _buildTopicButton(context, 'Math Object'),
              _buildTopicButton(context, 'String Methods'),
              _buildTopicButton(context, 'If Conditions'),
              _buildTopicButton(context, 'For Loop'),
              _buildTopicButton(context, 'While Loop'),
              _buildTopicButton(context, 'Do While Loop'),
              _buildTopicButton(context, 'Switch'),
              _buildTopicButton(context, 'Map'),
              _buildTopicButton(context, 'Filter'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
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
            if (text == 'Variables & Data Types') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VaribolsTestPage()),
              );
            }
          },
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

  Widget _buildTopicButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
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
            if (text == 'Identifiers') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const IdentifiersTestPage()),
              );
            }
            if (text == 'Data Types Test') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DataTypesTestPage()),
              );
            }
            if (text == 'Let, Const & Var') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LetConstVarTestPage(
                          onTestCompleted: () {},
                        )),
              );
            }
            if (text == 'Concat') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConcatTestPage()),
              );
            }
            if (text == 'Template Literals') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TemplateLiteralsQuizPage()),
              );
            }
            if (text == 'Arithmetic Operators') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ArithmeticOperatorsPage()),
              );
            }
            if (text == 'Unary Plus And Negation Operator') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UnaryOperatorsPage()),
              );
            }
            if (text == 'Math Object') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MathObjectPage()),
              );
            }
            if (text == 'String Methods') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StringMethodsPage()),
              );
            }
            if (text == 'If Conditions') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const IfConditionsPage()),
              );
            }
            if (text == 'For Loop') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForLoopPage()),
              );
            }
            if (text == 'While Loop') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WhileLoopPage()),
              );
            }
            if (text == 'Switch') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SwitchTestPage()),
              );
            }
            if (text == 'Do While Loop') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DoWhileLoopPage()),
              );
            }
            if (text == 'Map') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapTestPage()),
              );
            }
            if (text == 'Filter') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FilterTestPage()),
              );
            }
          },
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
