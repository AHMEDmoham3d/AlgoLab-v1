// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class BinarySearchTreePage extends StatefulWidget {
  const BinarySearchTreePage({super.key});

  @override
  _BinarySearchTreePageState createState() => _BinarySearchTreePageState();
}

class _BinarySearchTreePageState extends State<BinarySearchTreePage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Find the bug in the insert function for a BST:\n\n"
          "```cpp\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* left, *right;\n"
          "};\n\n"
          "Node* insert(Node* root, int value) {\n"
          "    if (root == nullptr)\n"
          "        root = new Node{value, nullptr, nullptr};\n"
          "    else if (value < root->data)\n"
          "        insert(root->left, value);\n"
          "    else\n"
          "        insert(root->right, value);\n"
          "    return root;\n"
          "}\n"
          "```",
      "options": [
        "root->left/right is not updated",
        "Memory allocation issue",
        "Infinite recursion",
        "Should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Identify the issue in this function for searching in a BST:\n\n"
              "```cpp\n"
              "bool search(Node* root, int key) {\n"
              "    if (root == nullptr || root->data == key)\n"
              "        return true;\n"
              "    if (key < root->data)\n"
              "        search(root->left, key);\n"
              "    else\n"
              "        search(root->right, key);\n"
              "    return false;\n"
              "}\n"
              "```",
      "options": [
        "Missing return statement",
        "Incorrect base case",
        "Infinite recursion risk",
        "Memory leak"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with this delete function for a BST?\n\n"
          "```cpp\n"
          "Node* deleteNode(Node* root, int key) {\n"
          "    if (root == nullptr) return root;\n"
          "    if (key < root->data)\n"
          "        root->left = deleteNode(root->left, key);\n"
          "    else if (key > root->data)\n"
          "        root->right = deleteNode(root->right, key);\n"
          "    else {\n"
          "        if (root->left == nullptr) {\n"
          "            Node* temp = root->right;\n"
          "            delete root;\n"
          "        }\n"
          "        else if (root->right == nullptr) {\n"
          "            Node* temp = root->left;\n"
          "            delete root;\n"
          "        }\n"
          "    }\n"
          "    return root;\n"
          "}\n"
          "```",
      "options": [
        "Deleted node pointer is not returned",
        "Incorrect condition checks",
        "Memory leak issue",
        "Infinite loop risk"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the logical error in this BST height function:\n\n"
          "```cpp\n"
          "int height(Node* root) {\n"
          "    if (root == nullptr)\n"
          "        return 0;\n"
          "    int leftHeight = height(root->left);\n"
          "    int rightHeight = height(root->right);\n"
          "    return max(leftHeight, rightHeight);\n"
          "}\n"
          "```",
      "options": [
        "Missing +1 in return statement",
        "Incorrect base case",
        "Leads to infinite recursion",
        "Memory issue"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is incorrect in this function for finding the minimum value in a BST?\n\n"
              "```cpp\n"
              "int findMin(Node* root) {\n"
              "    while (root->left != nullptr)\n"
              "        root = root->left;\n"
              "    return root->data;\n"
              "}\n"
              "```",
      "options": [
        "Should check if root is nullptr",
        "Infinite loop issue",
        "Incorrect traversal direction",
        "Returns wrong value"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the issue in this in-order traversal function:\n\n"
          "```cpp\n"
          "void inorder(Node* root) {\n"
          "    if (root != nullptr) {\n"
          "        inorder(root->left);\n"
          "        cout << root->data;\n"
          "        inorder(root->right);\n"
          "    }\n"
          "}\n"
          "```",
      "options": [
        "Missing space in cout statement",
        "Incorrect recursive calls",
        "May cause stack overflow",
        "Should return a list"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the mistake in this function to count nodes in a BST?\n\n"
              "```cpp\n"
              "int countNodes(Node* root) {\n"
              "    if (root == nullptr)\n"
              "        return 0;\n"
              "    return countNodes(root->left) + countNodes(root->right);\n"
              "}\n"
              "```",
      "options": [
        "Should add 1 to the return value",
        "Missing base case",
        "Infinite recursion risk",
        "Memory leak occurs"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Find the issue in this function for checking if a tree is balanced:\n\n"
              "```cpp\n"
              "bool isBalanced(Node* root) {\n"
              "    if (root == nullptr) return true;\n"
              "    int leftHeight = height(root->left);\n"
              "    int rightHeight = height(root->right);\n"
              "    return abs(leftHeight - rightHeight) <= 1;\n"
              "}\n"
              "```",
      "options": [
        "Should check balance for subtrees",
        "Incorrect height calculation",
        "Infinite recursion risk",
        "Memory issue"
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
        title: const Text("binary Search tree Quiz",
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
