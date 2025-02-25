// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key});

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Identify the bug in the function for adding an element:\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  while (head.next != null) {\n"
          "    head = head.next;\n"
          "  }\n"
          "  head.next = newNode;\n"
          "}\n"
          "```",
      "options": [
        "It modifies the head reference incorrectly",
        "Loop runs infinitely",
        "New node is not linked",
        "Memory allocation is incorrect"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with the following linked list function?\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  if (head == null) {\n"
          "    head = newNode;\n"
          "  }\n"
          "  Node temp = head;\n"
          "  while (temp.next != null) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  temp.next = newNode;\n"
          "}\n"
          "```",
      "options": [
        "head is not updated properly",
        "New node is not created",
        "Incorrect traversal logic",
        "Function should return head"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in this implementation?\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  Node temp = head;\n"
          "  while (temp.next != null) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  newNode.next = temp; // Error\n"
          "}\n"
          "```",
      "options": [
        "New node is not linked correctly",
        "It creates a cycle",
        "Memory leak occurs",
        "head should be checked"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What mistake exists in the following function?\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  if (head == null) {\n"
          "    head = newNode;\n"
          "    return;\n"
          "  }\n"
          "  Node temp = head;\n"
          "  while (temp != null) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  temp.next = newNode;\n"
          "}\n"
          "```",
      "options": [
        "Loop condition should be temp.next != null",
        "New node is not linked",
        "Function should return head",
        "New node should be created differently"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the logical error in this function:\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  if (head == null) {\n"
          "    newNode = head; // Error\n"
          "    return;\n"
          "  }\n"
          "  Node temp = head;\n"
          "  while (temp.next != null) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  temp.next = newNode;\n"
          "}\n"
          "```",
      "options": [
        "head should be updated differently",
        "Incorrect assignment to newNode",
        "Loop logic is incorrect",
        "Function should return void"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following function implementation?\n\n"
              "```dart\n"
              "void addToEnd(Node head, int value) {\n"
              "  Node newNode = Node(value);\n"
              "  Node temp = head;\n"
              "  while (temp != null) {\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  temp = newNode;\n"
              "}\n"
              "```",
      "options": [
        "New node is not linked correctly",
        "Incorrect traversal logic",
        "Loop should break earlier",
        "head should be updated differently"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the mistake in this linked list function?\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  if (head == null) {\n"
          "    head = newNode;\n"
          "  }\n"
          "  Node temp = head;\n"
          "  while (temp != null) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  temp.next = newNode;\n"
          "}\n"
          "```",
      "options": [
        "head should be returned after modification",
        "New node is not linked properly",
        "Loop runs incorrectly",
        "Memory leak occurs"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Find the issue in this function for inserting a node:\n\n"
          "```dart\n"
          "void addToEnd(Node head, int value) {\n"
          "  Node newNode = Node(value);\n"
          "  Node temp = head;\n"
          "  while (temp.next != null) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  temp = newNode;\n"
          "}\n"
          "```",
      "options": [
        "New node is not linked correctly",
        "It modifies the head reference",
        "Loop runs infinitely",
        "Function should return head"
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
        title: const Text("Set Quiz",
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
