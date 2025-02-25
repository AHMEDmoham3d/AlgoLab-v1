// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({super.key});

  @override
  _QueueageState createState() => _QueueageState();
}

class _QueueageState extends State<QueuePage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the mistake in this Queue implementation?\n\n"
          "```dart\n"
          "class Queue {\n"
          "  List<int> items = [];\n\n"
          "  void enqueue(int value) {\n"
          "    items.add(value);\n"
          "  }\n\n"
          "  int dequeue() {\n"
          "    return items.removeLast(); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Queue should use FIFO order",
        "removeLast() should be removeAt(0)",
        "Memory leak occurs",
        "enqueue method is incorrect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Find the issue in this Queue class:\n\n"
          "```dart\n"
          "class Queue {\n"
          "  List<int> items = [];\n\n"
          "  void enqueue(int value) {\n"
          "    items.insert(0, value);\n"
          "  }\n\n"
          "  int dequeue() {\n"
          "    return items.removeAt(0);\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "enqueue inserts elements incorrectly",
        "dequeue removes elements incorrectly",
        "Queue operates in LIFO order",
        "Queue should be implemented using a linked list"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Identify the logical error in this Queue implementation:\n\n"
          "```dart\n"
          "class Queue {\n"
          "  List<int> items = [];\n\n"
          "  void enqueue(int value) {\n"
          "    items.add(value);\n"
          "  }\n\n"
          "  int dequeue() {\n"
          "    if (items.isEmpty) {\n"
          "      return -1; // Error\n"
          "    }\n"
          "    return items[0]; // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Returning -1 is incorrect",
        "Should remove the front element",
        "Queue should return null when empty",
        "enqueue method is incorrect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the mistake in this circular queue implementation?\n\n"
              "```dart\n"
              "class CircularQueue {\n"
              "  List<int> queue;\n"
              "  int front = -1, rear = -1, size;\n\n"
              "  CircularQueue(this.size) : queue = List.filled(size, 0);\n\n"
              "  void enqueue(int value) {\n"
              "    if ((rear + 1) % size == front) {\n"
              "      print('Queue is full');\n"
              "    } else {\n"
              "      rear = (rear + 1) % size;\n"
              "      queue[rear] = value;\n"
              "    }\n"
              "  }\n\n"
              "  int dequeue() {\n"
              "    if (front == -1) {\n"
              "      print('Queue is empty');\n"
              "      return -1;\n"
              "    }\n"
              "    int item = queue[front];\n"
              "    if (front == rear) {\n"
              "      front = rear = -1;\n"
              "    } else {\n"
              "      front = (front + 1) % size;\n"
              "    }\n"
              "    return item;\n"
              "  }\n"
              "}\n"
              "```",
      "options": [
        "Queue never becomes empty",
        "front should be updated in enqueue",
        "front should be initialized to 0",
        "rear is not updated correctly"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the bug in this priority queue implementation:\n\n"
          "```dart\n"
          "import 'dart:collection';\n\n"
          "class PriorityQueue {\n"
          "  Queue<int> queue = Queue<int>();\n\n"
          "  void enqueue(int value) {\n"
          "    queue.add(value);\n"
          "    queue = Queue<int>.from(queue.toList()..sort());\n"
          "  }\n\n"
          "  int dequeue() {\n"
          "    return queue.removeFirst();\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Sorting should be in descending order",
        "Reassigning queue is inefficient",
        "PriorityQueue should use a heap",
        "enqueue method is incorrect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the issue in this linked list Queue implementation?\n\n"
              "```dart\n"
              "class Node {\n"
              "  int data;\n"
              "  Node? next;\n"
              "  Node(this.data);\n"
              "}\n\n"
              "class Queue {\n"
              "  Node? front, rear;\n\n"
              "  void enqueue(int value) {\n"
              "    Node newNode = Node(value);\n"
              "    if (rear == null) {\n"
              "      front = rear = newNode;\n"
              "      return;\n"
              "    }\n"
              "    rear?.next = newNode;\n"
              "    rear = rear?.next;\n"
              "  }\n\n"
              "  int dequeue() {\n"
              "    if (front == null) {\n"
              "      throw Exception('Queue is empty');\n"
              "    }\n"
              "    int value = front!.data;\n"
              "    front = front?.next;\n"
              "    return value;\n"
              "  }\n"
              "}\n"
              "```",
      "options": [
        "rear should be updated differently",
        "enqueue should return void",
        "front should not be nullable",
        "Linked list implementation is incorrect"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is incorrect in this double-ended queue (Deque) implementation?\n\n"
              "```dart\n"
              "class Deque {\n"
              "  List<int> deque = [];\n\n"
              "  void addFront(int value) {\n"
              "    deque.insert(0, value);\n"
              "  }\n\n"
              "  void addRear(int value) {\n"
              "    deque.add(value);\n"
              "  }\n\n"
              "  int removeFront() {\n"
              "    return deque.removeAt(0);\n"
              "  }\n\n"
              "  int removeRear() {\n"
              "    return deque.removeAt(0); // Error\n"
              "  }\n"
              "}\n"
              "```",
      "options": [
        "removeRear should use removeLast()",
        "addFront is incorrect",
        "Deque should use a linked list",
        "removeFront should be changed"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the mistake in this Queue implementation:\n\n"
          "```dart\n"
          "class Queue {\n"
          "  List<int> queue = [];\n\n"
          "  void enqueue(int value) {\n"
          "    queue.add(value);\n"
          "  }\n\n"
          "  int dequeue() {\n"
          "    if (queue.isEmpty) {\n"
          "      throw Exception('Queue is empty');\n"
          "    }\n"
          "    return queue.last; // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Should remove the first element",
        "Queue should not throw exceptions",
        "enqueue is implemented incorrectly",
        "Queue should use a circular buffer"
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
        title: const Text("Queue Quiz",
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
