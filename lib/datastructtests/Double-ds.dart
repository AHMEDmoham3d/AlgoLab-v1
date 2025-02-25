// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class DoubletPagePage extends StatefulWidget {
  const DoubletPagePage({super.key});

  @override
  _DoubletPagePageState createState() => _DoubletPagePageState();
}

class _DoubletPagePageState extends State<DoubletPagePage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "Find the bug in the function for adding a node at the end:\n\n"
              "```dart\n"
              "void addToEnd(DNode head, int value) {\n"
              "  DNode newNode = DNode(value);\n"
              "  while (head.next != null) {\n"
              "    head = head.next;\n"
              "  }\n"
              "  head.next = newNode;\n"
              "  newNode.prev = null; // Error\n"
              "}"
              "```",
      "options": [
        "newNode.prev should be head",
        "Loop runs infinitely",
        "head is modified incorrectly",
        "Memory allocation is incorrect"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the issue in this doubly linked list insertion:\n\n"
          "```dart\n"
          "void insertAtHead(DNode head, int value) {\n"
          "  DNode newNode = DNode(value);\n"
          "  newNode.next = head;\n"
          "  head.prev = newNode; // Error\n"
          "  head = newNode;\n"
          "}"
          "```",
      "options": [
        "head should be checked for null",
        "head.prev should be set only if head is not null",
        "newNode.next is incorrect",
        "Loop logic is incorrect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Find the logical error in this function:\n\n"
          "```dart\n"
          "void deleteNode(DNode head, int value) {\n"
          "  while (head != null && head.value != value) {\n"
          "    head = head.next;\n"
          "  }\n"
          "  if (head == null) return;\n"
          "  head.prev.next = head.next; // Error\n"
          "  if (head.next != null) {\n"
          "    head.next.prev = head.prev;\n"
          "  }\n"
          "}"
          "```",
      "options": [
        "head.prev should be checked for null",
        "Loop runs infinitely",
        "head should not be modified",
        "head.next is incorrect"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What mistake exists in this doubly linked list function?\n\n"
          "```dart\n"
          "void addAfter(DNode head, int key, int value) {\n"
          "  DNode newNode = DNode(value);\n"
          "  while (head != null && head.value != key) {\n"
          "    head = head.next;\n"
          "  }\n"
          "  if (head == null) return;\n"
          "  newNode.next = head.next;\n"
          "  head.next.prev = newNode; // Error\n"
          "  head.next = newNode;\n"
          "  newNode.prev = head;\n"
          "}"
          "```",
      "options": [
        "head.next should be checked for null",
        "newNode.prev is incorrect",
        "Loop logic is incorrect",
        "Function should return a value"
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
        title: const Text("Double linked list Quiz",
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
