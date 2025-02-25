// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class DequePage extends StatefulWidget {
  const DequePage({super.key});

  @override
  _DequePageState createState() => _DequePageState();
}

class _DequePageState extends State<DequePage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Find the error in the following deque implementation:\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  void addFront(int value) {\n"
          "    deque.insert(deque.length, value); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Wrong insert position",
        "Memory leak",
        "Value is not added",
        "Deque should be a linked list"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the mistake in this remove function:\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  void removeFront() {\n"
          "    if (deque.isEmpty) return;\n"
          "    deque.removeAt(deque.length); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Index out of range",
        "Deque becomes null",
        "Wrong element removed",
        "Loop runs infinitely"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the issue in this deque class:\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  void addRear(int value) {\n"
          "    deque.insert(0, value); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Wrong position for insertion",
        "Deque should be a stack",
        "Incorrect data structure",
        "Memory allocation issue"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with this deque operation?\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  int getFront() {\n"
          "    return deque[0]; // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Should check if deque is empty",
        "Wrong index used",
        "Deque should return a list",
        "Function should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Spot the mistake in this deque method:\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  void removeRear() {\n"
          "    deque.removeAt(0); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Wrong index removed",
        "Deque should be empty first",
        "Should remove from end",
        "Index out of range"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the bug in this implementation:\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  void addFront(int value) {\n"
          "    deque.add(value); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Should insert at index 0",
        "Memory leak occurs",
        "Value is not stored",
        "Should return deque"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What issue exists in this function?\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  int getRear() {\n"
          "    return deque.first; // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Should return last element",
        "Deque should be null first",
        "Should return a list",
        "Function should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the logical mistake in this implementation:\n\n"
          "```dart\n"
          "class Deque {\n"
          "  List<int> deque = [];\n"
          "  void removeFront() {\n"
          "    deque.removeLast(); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Should remove from index 0",
        "Deque should be empty first",
        "Incorrect function return type",
        "Index out of range error"
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
        title: const Text("Deque Quiz",
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
