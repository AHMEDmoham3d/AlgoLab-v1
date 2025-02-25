// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LinkedListPage extends StatefulWidget {
  const LinkedListPage({super.key});

  @override
  _LinkedListPageState createState() => _LinkedListPageState();
}

class _LinkedListPageState extends State<LinkedListPage> {
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
          "int main() {\n"
          "    Node* head;\n"
          "    head->data = 10;\n"
          "    head->next = NULL;\n"
          "    cout << head->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "head is not initialized before dereferencing",
        "Missing semicolon in struct definition",
        "Incorrect pointer syntax",
        "Cannot assign NULL to next"
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
          "void insertAtEnd(Node* head, int value) {\n"
          "    Node* newNode = new Node();\n"
          "    newNode->data = value;\n"
          "    newNode->next = NULL;\n"
          "    Node* temp = head;\n"
          "    while (temp != NULL) {\n"
          "        temp = temp->next;\n"
          "    }\n"
          "    temp = newNode;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = NULL;\n"
          "    insertAtEnd(head, 5);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak due to missing delete statement",
        "Loop does not stop correctly",
        "New node is not linked to the list",
        "Head should not be NULL"
      ],
      "answer": 2,
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
          "void deleteList(Node* head) {\n"
          "    while (head != NULL) {\n"
          "        delete head;\n"
          "        head = head->next;\n"
          "    }\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = new Node{10, NULL};\n"
          "    deleteList(head);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Loop does not traverse correctly",
        "Memory is not released properly",
        "head->next should be deleted before head",
        "Accessing a deleted node causes undefined behavior"
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
          "void printList(Node* head) {\n"
          "    while (head != NULL);\n"
          "        cout << head->data << \" \";\n"
          "        head = head->next;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = new Node{1, NULL};\n"
          "    printList(head);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "head is not updated inside the loop",
        "Infinite loop due to semicolon after while",
        "Incorrect pointer arithmetic",
        "Memory leak occurs"
      ],
      "answer": 1,
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
          "void reverseList(Node* head) {\n"
          "    Node* prev = NULL, *curr = head, *next = NULL;\n"
          "    while (curr != NULL) {\n"
          "        next = curr->next;\n"
          "        curr->next = prev;\n"
          "        prev = curr;\n"
          "        curr = next;\n"
          "    }\n"
          "}\n\n"
          "int main() {\n"
          "    Node* head = new Node{1, NULL};\n"
          "    reverseList(head);\n"
          "    cout << head->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "head is not updated after reversal",
        "prev should be initialized with head",
        "Loop does not terminate properly",
        "head is modified incorrectly"
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
          "Node* mergeLists(Node* l1, Node* l2) {\n"
          "    if (l1 == NULL) return l2;\n"
          "    if (l2 == NULL) return l1;\n"
          "    Node* head = NULL;\n"
          "    if (l1->data < l2->data) {\n"
          "        head = l1;\n"
          "        head->next = mergeLists(l1->next, l2);\n"
          "    } else {\n"
          "        head = l2;\n"
          "        head->next = mergeLists(l1, l2->next);\n"
          "    }\n"
          "    return head;\n"
          "}\n\n"
          "int main() {\n"
          "    Node* l1 = new Node{1, NULL};\n"
          "    Node* l2 = new Node{2, NULL};\n"
          "    Node* merged = mergeLists(l1, l2);\n"
          "    cout << merged->data << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Base cases do not handle empty lists correctly",
        "head is not properly assigned",
        "Function may cause stack overflow due to recursion",
        "Loop should be used instead of recursion"
      ],
      "answer": 2,
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
        title: const Text("LinkedList Quiz",
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
