// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class VaribolCPlsPlsPage extends StatefulWidget {
  const VaribolCPlsPlsPage({super.key});

  @override
  _VaribolCPlsPlsPageState createState() => _VaribolCPlsPlsPageState();
}

class _VaribolCPlsPlsPageState extends State<VaribolCPlsPlsPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in defining the following variable in C++?",
      "code": "int 1number = 10;",
      "options": [
        "A variable cannot start with a number",
        "float should be used instead of int",
        "The value must be enclosed in quotes",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem in the following code?",
      "code": "const int x = 5;\nx = 10;",
      "options": [
        "Variable x is not defined",
        "Cannot reassign a value to a const variable",
        "x should be defined using float",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following code?",
      "code": "int x = 5;\nint x = 10;",
      "options": [
        "Cannot redefine the same variable in the same scope",
        "static should be used instead of int",
        "A new value should be assigned to x instead of redefining it",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem in the following code?",
      "code": "cout << y;\nint y = 20;",
      "options": [
        "Variable y is not defined",
        "Cannot use a variable before defining it",
        "y should be defined using float",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in defining the following variable?",
      "code": "int my-var = 50;",
      "options": [
        "A variable name cannot contain (-)",
        "float should be used instead of int",
        "const should be used instead of int",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem in the following code?",
      "code": "float pi = 3.14;\nint pi = 5;",
      "options": [
        "Cannot redefine a variable with a different type",
        "pi should be declared as const",
        "Use double instead of float",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following code?",
      "code": "char letter = 'AB';",
      "options": [
        "A char variable can only store a single character",
        "Use double quotes instead of single quotes",
        "letter should be defined as string",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue with this variable declaration?",
      "code": "bool isReady = 1.5;",
      "options": [
        "A boolean variable can only be true (1) or false (0)",
        "Use int instead of bool",
        "The value must be a string",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following code?",
      "code": "string name = 'John';",
      "options": [
        "Use double quotes for string literals",
        "Use char instead of string",
        "The variable must be an int",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue with this variable declaration?",
      "code": "int number;\ncout << number;",
      "options": [
        "Variable 'number' is used without being initialized",
        "number must be declared as float",
        "The variable name is invalid",
        "No error"
      ],
      "answer": 0,
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
        title: const Center(
          child: Text("Variables Quiz",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
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
