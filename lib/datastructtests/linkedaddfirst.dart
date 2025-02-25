// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LinkedListAddFirstPage extends StatefulWidget {
  const LinkedListAddFirstPage({super.key});

  @override
  _LinkedListAddFirstPageState createState() => _LinkedListAddFirstPageState();
}

class _LinkedListAddFirstPageState extends State<LinkedListAddFirstPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node* head, int value) {\n"
          "    Node* newNode = new Node;\n"
          "    newNode->data = value;\n"
          "    newNode->next = head;\n"
          "    head = newNode;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = nullptr;\n"
          "    insertAtBeginning(head, 10);\n"
          "    cout << head->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "head is not updated outside the function",
        "Missing memory deallocation",
        "newNode should be dynamically allocated",
        "insertAtBeginning should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node*& head, int value) {\n"
          "    Node* newNode = new Node;\n"
          "    newNode->data = value;\n"
          "    head->next = newNode;\n"
          "    head = newNode;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = nullptr;\n"
          "    insertAtBeginning(head, 10);\n"
          "    cout << head->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "head is not updated correctly",
        "newNode is not assigned a next pointer",
        "head should not be passed by reference",
        "Dereferencing a null pointer"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node*& head, int value) {\n"
          "    Node newNode;\n"
          "    newNode.data = value;\n"
          "    newNode.next = head;\n"
          "    head = &newNode;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = nullptr;\n"
          "    insertAtBeginning(head, 10);\n"
          "    cout << head->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "newNode is a local variable",
        "Memory leak occurs",
        "Dereferencing a null pointer",
        "Incorrect use of 'new' keyword"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node*& head, int value) {\n"
          "    Node* newNode = new Node();\n"
          "    newNode->data = value;\n"
          "    head = newNode;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = nullptr;\n"
          "    insertAtBeginning(head, 10);\n"
          "    cout << head->next->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "newNode's next pointer is not initialized",
        "Memory leak occurs",
        "Dereferencing a null pointer",
        "head should not be passed by reference"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node*& head, int value) {\n"
          "    Node* newNode = nullptr;\n"
          "    newNode->data = value;\n"
          "    newNode->next = head;\n"
          "    head = newNode;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = nullptr;\n"
          "    insertAtBeginning(head, 10);\n"
          "    cout << head->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "newNode is not allocated memory",
        "head is not updated",
        "Dereferencing a null pointer",
        "Incorrect function signature"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node*& head, int value) {\n"
          "    head = new Node{value, head};\n"
          "}\n"
          "```",
      "options": [
        "Memory leak",
        "Head is not checked for null",
        "Missing proper memory allocation",
        "Syntax error in node creation"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* next;\n"
          "};\n\n"
          "void insertAtBeginning(Node*& head, int value) {\n"
          "    head = nullptr;\n"
          "    head = new Node;\n"
          "    head->data = value;\n"
          "    head->next = nullptr;\n"
          "}\n"
          "```",
      "options": [
        "head is reassigned before allocation",
        "head is not checked for null",
        "Redundant memory allocation",
        "Syntax error in function"
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
        title: const Text("Linked List Quiz",
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
