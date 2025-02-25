// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class FibonacciPage extends StatefulWidget {
  const FibonacciPage({super.key});

  @override
  _FibonacciPageState createState() => _FibonacciPageState();
}

class _FibonacciPageState extends State<FibonacciPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following Fibonacci function?\n\n"
          "int fibonacci(int n) {\n"
          "  if (n == 0) return 0;\n"
          "  if (n == 1) return 1;\n"
          "  return fibonacci(n - 1) + fibonacci(n - 2);\n"
          "}",
      "options": [
        "No error",
        "Base case should be n <= 1",
        "Missing memoization",
        "It should use iteration"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Identify the mistake in this Fibonacci function:\n\n"
          "int fibonacci(int n) {\n"
          "  if (n <= 1) return n;\n"
          "  return fibonacci(n - 1) + fibonacci(n - 3);\n"
          "}",
      "options": [
        "Incorrect recursive call",
        "Base case is wrong",
        "Extra recursive call",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in this iterative Fibonacci function?\n\n"
          "int fibonacci(int n) {\n"
          "  int a = 0, b = 1, c;\n"
          "  for (int i = 2; i < n; i++) {\n"
          "    c = a + b;\n"
          "    a = b;\n"
          "    b = c;\n"
          "  }\n"
          "  return c;\n"
          "}",
      "options": [
        "Loop should run until i <= n",
        "Base case is incorrect",
        "Variable c is uninitialized",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the logical mistake in this Fibonacci function?\n\n"
          "int fibonacci(int n) {\n"
          "  if (n == 1 || n == 2) return 1;\n"
          "  return fibonacci(n - 1) + fibonacci(n - 2);\n"
          "}",
      "options": [
        "Base case should be n <= 1",
        "Should return 0 for n = 0",
        "Incorrect return values",
        "No mistake"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Find the issue in this Fibonacci implementation:\n\n"
          "int fibonacci(int n) {\n"
          "  int a = 0, b = 1;\n"
          "  while (n > 0) {\n"
          "    a = b;\n"
          "    b = a + b;\n"
          "    n--;\n"
          "  }\n"
          "  return a;\n"
          "}",
      "options": [
        "Loop runs incorrectly",
        "Wrong variable update",
        "Base case missing",
        "No mistake"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the problem in this Fibonacci function?\n\n"
          "int fibonacci(int n) {\n"
          "  if (n == 0) return 0;\n"
          "  if (n == 1) return 1;\n"
          "  return fibonacci(n - 1) + fibonacci(n - 2);\n"
          "}",
      "options": [
        "Inefficient solution",
        "Base case should include n == 2",
        "Uses too much memory",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the mistake in this Fibonacci function:\n\n"
          "int fibonacci(int n) {\n"
          "  if (n < 0) return 0;\n"
          "  if (n == 0) return 1;\n"
          "  return fibonacci(n - 1) + fibonacci(n - 2);\n"
          "}",
      "options": [
        "Incorrect base case",
        "n < 0 should return -1",
        "Should return 0 for n == 0",
        "No mistake"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is wrong with this recursive Fibonacci function?\n\n"
          "int fibonacci(int n, int a = 0, int b = 1) {\n"
          "  if (n == 0) return a;\n"
          "  if (n == 1) return b;\n"
          "  return fibonacci(n - 1, b, a + b);\n"
          "}",
      "options": [
        "Extra parameters should not be used",
        "Wrong base case",
        "Incorrect recursive call",
        "No mistake"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question": "What is the bug in this Fibonacci function?\n\n"
          "int fibonacci(int n) {\n"
          "  int a = 1, b = 1, c;\n"
          "  for (int i = 2; i <= n; i++) {\n"
          "    c = a + b;\n"
          "    a = b;\n"
          "    b = c;\n"
          "  }\n"
          "  return c;\n"
          "}",
      "options": [
        "Should start with a = 0, b = 1",
        "Loop should run till i < n",
        "Incorrect return value",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the mistake in this Fibonacci function:\n\n"
          "int fibonacci(int n) {\n"
          "  if (n <= 1) return n;\n"
          "  return fibonacci(n - 1) + fibonacci(n - 2);\n"
          "}",
      "options": [
        "Incorrect base case",
        "Needs memoization",
        "Should return 1 for n = 1",
        "No mistake"
      ],
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
        title: const Text("Fibonacci Quiz",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: goBack),
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
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: allCorrect ? goBack : resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: allCorrect ? Colors.green : Colors.red,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40),
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
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12)),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  color:
                                      isSelected ? Colors.blue : Colors.white,
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
                        ),
                        child: const Text("Next",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
