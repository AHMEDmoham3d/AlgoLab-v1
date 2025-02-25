// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class DataTypesTestPage extends StatefulWidget {
  // ignore: use_super_parameters
  const DataTypesTestPage({Key? key}) : super(key: key);

  @override
  _DataTypesTestPageState createState() => _DataTypesTestPageState();
}

class _DataTypesTestPageState extends State<DataTypesTestPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in this JavaScript code?\n\nvar 123name = 'John';",
      "options": [
        "Variable name cannot start with a number",
        "Missing semicolon",
        "Cannot use 'var' for declaration",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the output of 2 + '2' in JavaScript?",
      "options": ["'22'", "4", "Error", "'4'"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following code?\n\nconst x;\nx = 10;",
      "options": [
        "A const variable must be initialized when declared",
        "x should be defined using var",
        "Missing semicolon",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the problem in this JavaScript code?\n\nlet age = '25';\nconsole.log(age * 2);",
      "options": [
        "String cannot be multiplied by a number",
        "Missing semicolon",
        "JavaScript implicitly converts the string to a number",
        "No error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following code?\n\nlet num = '10' - 5;",
      "options": [
        "String and number cannot be subtracted",
        "JavaScript converts '10' to a number and subtracts",
        "Error: Type mismatch",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the output of the following JavaScript code?\n\nconsole.log(typeof NaN);",
      "options": ["'number'", "'NaN'", "'undefined'", "'object'"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with this JavaScript code?\n\nlet data = null;\nconsole.log(typeof data);",
      "options": [
        "null is not a valid value",
        "typeof null returns 'null'",
        "typeof null incorrectly returns 'object'",
        "No error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the output of the following JavaScript code?\n\nconsole.log(typeof []);",
      "options": ["'array'", "'object'", "'list'", "'undefined'"],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following code?\n\nlet x = 10;\nlet x = 20;",
      "options": [
        "A let variable cannot be redeclared in the same scope",
        "JavaScript allows variable redeclaration",
        "x should be declared using var",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the output of the following JavaScript code?\n\nconsole.log(0.1 + 0.2 === 0.3);",
      "options": ["true", "false", "Error", "'0.3'"],
      "answer": 1,
      "selected": -1
    }
  ];

  int currentQuestionIndex = 0;
  bool testCompleted = false;

  void selectAnswer(int optionIndex) {
    setState(() {
      questions[currentQuestionIndex]["selected"] = optionIndex;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        testCompleted = true;
      }
    });
  }

  int calculateScore() {
    return questions.where((q) => q["selected"] == q["answer"]).length;
  }

  void resetQuiz() {
    setState(() {
      testCompleted = false;
      currentQuestionIndex = 0;
      for (var question in questions) {
        question["selected"] = -1;
      }
    });
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();
    bool allCorrect = score == questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Types Quiz",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // لضبط النص في المنتصف
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: goBack,
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: testCompleted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Quiz Completed!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("Your Score: $score / ${questions.length}",
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: allCorrect ? goBack : resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: allCorrect ? Colors.green : Colors.red,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      allCorrect ? "Go Back" : "Retry Quiz",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "${questions[currentQuestionIndex]["question"]}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: List.generate(
                        questions[currentQuestionIndex]["options"].length,
                        (optionIndex) {
                          bool isSelected = questions[currentQuestionIndex]
                                  ["selected"] ==
                              optionIndex;
                          return GestureDetector(
                            onTap: () => selectAnswer(optionIndex),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                color: isSelected ? Colors.blue : Colors.white,
                              ),
                              child: Text(
                                questions[currentQuestionIndex]["options"]
                                    [optionIndex],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed:
                          questions[currentQuestionIndex]["selected"] != -1
                              ? nextQuestion
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      ),
                      child: const Text("Next",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
