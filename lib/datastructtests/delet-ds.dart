// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class DelettPage extends StatefulWidget {
  const DelettPage({super.key});

  @override
  _DelettPageState createState() => _DelettPageState();
}

class _DelettPageState extends State<DelettPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in the following code for deleting a node from a linked list?\n\n"
              "```dart\n"
              "void deleteNode(Node head, int key) {\n"
              "  Node temp = head, prev = null;\n"
              "  if (temp != null && temp.value == key) {\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  while (temp != null && temp.value != key) {\n"
              "    prev = temp;\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  prev.next = temp.next;\n"
              "}\n"
              "```",
      "options": [
        "The first node is not deleted correctly",
        "The prev pointer is not properly initialized",
        "The new head should be returned",
        "There is an issue with the first condition"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Identify the error in the following code for deleting the last node:\n\n"
              "```dart\n"
              "void deleteLast(Node head) {\n"
              "  Node temp = head;\n"
              "  while (temp.next != null) {\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  temp = null;\n"
              "}\n"
              "```",
      "options": [
        "The previous pointer to the last node should be updated",
        "The list will become inaccessible",
        "A check should be added for an empty list",
        "The deleted node's memory is not freed"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following code for deleting the first node?\n\n"
              "```dart\n"
              "void deleteFirst(Node head) {\n"
              "  if (head == null) return;\n"
              "  Node temp = head;\n"
              "  head = head.next;\n"
              "  temp = null;\n"
              "}\n"
              "```",
      "options": [
        "The deleted node's memory is not properly freed",
        "The list becomes inaccessible",
        "The list head is not updated",
        "The code works correctly"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error when deleting a specific node?\n\n"
          "```dart\n"
          "void deleteNode(Node head, int key) {\n"
          "  Node temp = head;\n"
          "  while (temp != null && temp.value != key) {\n"
          "    temp = temp.next;\n"
          "  }\n"
          "  if (temp == null) return;\n"
          "  temp = temp.next;\n"
          "}\n"
          "```",
      "options": [
        "The previous node is not updated",
        "A check for an empty list is missing",
        "The temp pointer is not used correctly",
        "The list is modified correctly"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Where is the error in this code for deleting a node from a linked list?\n\n"
              "```dart\n"
              "void deleteNode(Node head, int key) {\n"
              "  Node temp = head, prev = null;\n"
              "  while (temp != null && temp.value != key) {\n"
              "    prev = temp;\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  if (temp == null) return;\n"
              "  prev = temp.next;\n"
              "}\n"
              "```",
      "options": [
        "The prev pointer is not updated correctly",
        "The last node is not deleted correctly",
        "The list will become inaccessible",
        "A check for an empty list is missing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the error in this code for deleting the last node?\n\n"
              "```dart\n"
              "void deleteLast(Node head) {\n"
              "  if (head == null) return;\n"
              "  Node temp = head;\n"
              "  while (temp.next != null) {\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  temp.next = null;\n"
              "}\n"
              "```",
      "options": [
        "No pointer to the previous node",
        "The list becomes inaccessible",
        "The code works correctly",
        "A check for a single-node list is needed"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the code for deleting a specific node?\n\n"
              "```dart\n"
              "void deleteNode(Node head, int key) {\n"
              "  if (head == null) return;\n"
              "  if (head.value == key) {\n"
              "    head = head.next;\n"
              "    return;\n"
              "  }\n"
              "  Node temp = head;\n"
              "  while (temp.next != null && temp.next.value != key) {\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  if (temp.next == null) return;\n"
              "  temp.next = temp.next.next;\n"
              "}\n"
              "```",
      "options": [
        "The list is not updated correctly",
        "The deleted node should be freed",
        "The last node is not deleted",
        "The code works without issues"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "Identify the error in the code for deleting a specific node:\n\n"
              "```dart\n"
              "void deleteNode(Node head, int key) {\n"
              "  if (head == null) return;\n"
              "  Node temp = head;\n"
              "  if (temp.value == key) {\n"
              "    temp = temp.next;\n"
              "    return;\n"
              "  }\n"
              "  while (temp != null && temp.next.value != key) {\n"
              "    temp = temp.next;\n"
              "  }\n"
              "  if (temp == null) return;\n"
              "  temp.next = temp.next.next;\n"
              "}\n"
              "```",
      "options": [
        "The first node is not deleted correctly",
        "There is no pointer to the previous node",
        "The last node is not handled correctly",
        "The new head should be returned"
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
        title: const Text("Delet  Quiz",
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
