// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LinkedListAddendtPage extends StatefulWidget {
  const LinkedListAddendtPage({super.key});

  @override
  _LinkedListAddendtPageState createState() => _LinkedListAddendtPageState();
}

class _LinkedListAddendtPageState extends State<LinkedListAddendtPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": """
class Node {
  int data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;
  
  void addToEnd(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp != null) {
        temp = temp.next;
      }
      temp!.next = newNode; // Find the bug
    }
  }
}
""",
      "options": [
        "The loop condition is incorrect",
        "temp is null before assignment",
        "Head is not updated properly",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      head = newNode; // Find the bug
    }
  }
}
""",
      "options": [
        "head should not be updated",
        "temp should be updated instead",
        "newNode is not linked properly",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    Node? temp = head;
    while (temp != null) {
      temp = temp.next;
    }
    temp!.next = newNode; // Find the bug
  }
}
""",
      "options": [
        "Loop runs indefinitely",
        "temp is null before assignment",
        "Head is not checked for null",
        "No error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp = newNode; // Find the bug
  }
}
""",
      "options": [
        "New node is not linked correctly",
        "temp should point to newNode.next",
        "Loop should check temp itself",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node temp = head; // Find the bug
      while (temp.next != null) {
        temp = temp.next!;
      }
      temp.next = newNode;
    }
  }
}
""",
      "options": [
        "temp should be nullable",
        "head should be checked before assignment",
        "Loop should end before null",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      return;
    }
    Node temp = head!;
    while (temp.next != null) {
      temp = temp.next!;
    }
    temp.next = temp; // Find the bug
  }
}
""",
      "options": [
        "Infinite loop will occur",
        "New node is not linked properly",
        "temp should not be assigned to itself",
        "No error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp != null) {
        temp = temp.next;
      }
      temp?.next = newNode; // Find the bug
    }
  }
}
""",
      "options": [
        "temp should not be null before assignment",
        "Loop condition should be fixed",
        "newNode is not assigned properly",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": """
class LinkedList {
  Node? head;

  void addToEnd(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      return;
    }
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    newNode.next = temp; // Find the bug
  }
}
""",
      "options": [
        "newNode.next should not be temp",
        "Loop should check temp itself",
        "temp should be assigned to newNode",
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
        title: const Text("linked list end Quiz",
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
