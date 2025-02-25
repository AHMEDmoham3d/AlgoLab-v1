// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class TreePage extends StatefulWidget {
  const TreePage({super.key});

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Find the error in the following tree insertion function:\n\n"
          "```cpp\n"
          "struct Node {\n"
          "    int data;\n"
          "    Node* left, *right;\n"
          "};\n"
          "void insert(Node* root, int value) {\n"
          "    if (root == nullptr) {\n"
          "        root = new Node{value, nullptr, nullptr};\n"
          "    } else if (value < root->data) {\n"
          "        insert(root->left, value);\n"
          "    } else {\n"
          "        insert(root->right, value);\n"
          "    }\n"
          "}\n"
          "```",
      "options": [
        "Root is not updated properly",
        "Memory allocation is incorrect",
        "Tree structure is incorrect",
        "Function should return Node*"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in this BST search function?\n\n"
          "```cpp\n"
          "bool search(Node* root, int value) {\n"
          "    while (root != nullptr) {\n"
          "        if (root->data == value) return true;\n"
          "        else if (value < root->data)\n"
          "            root = root->left;\n"
          "        else\n"
          "            root->right; // Error\n"
          "    }\n"
          "    return false;\n"
          "}\n"
          "```",
      "options": [
        "Incorrect traversal logic",
        "Syntax error in right child assignment",
        "Function should return void",
        "Loop should break earlier"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Identify the mistake in the tree deletion function:\n\n"
          "```cpp\n"
          "Node* deleteNode(Node* root, int key) {\n"
          "    if (root == nullptr) return root;\n"
          "    if (key < root->data) {\n"
          "        root->left = deleteNode(root->left, key);\n"
          "    } else if (key > root->data) {\n"
          "        root->right = deleteNode(root->right, key);\n"
          "    } else {\n"
          "        if (root->left == nullptr) {\n"
          "            Node* temp = root->right;\n"
          "            delete root;\n"
          "            return temp;\n"
          "        } else if (root->right == nullptr) {\n"
          "            Node* temp = root->left;\n"
          "            delete root;\n"
          "        }\n"
          "    }\n"
          "    return root;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak occurs",
        "Incorrect deletion logic",
        "Right child deletion is missing return",
        "Function should return void"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the logical error in this tree traversal function:\n\n"
          "```cpp\n"
          "void inorder(Node* root) {\n"
          "    if (root == nullptr)\n"
          "        return;\n"
          "    inorder(root->left);\n"
          "    inorder(root->right);\n"
          "    cout << root->data << \" \";\n"
          "}\n"
          "```",
      "options": [
        "It performs postorder traversal instead of inorder",
        "It skips the left subtree",
        "It does not print values correctly",
        "It should return a list of values"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in this function for counting tree nodes?\n\n"
              "```cpp\n"
              "int countNodes(Node* root) {\n"
              "    if (root == nullptr) return 0;\n"
              "    return countNodes(root->left) + countNodes(root->right);\n"
              "}\n"
              "```",
      "options": [
        "It does not count the root node",
        "It does not handle empty trees",
        "Memory leak occurs",
        "It should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the error in the height calculation function:\n\n"
          "```cpp\n"
          "int treeHeight(Node* root) {\n"
          "    if (root == nullptr) return 0;\n"
          "    int leftHeight = treeHeight(root->left);\n"
          "    int rightHeight = treeHeight(root->right);\n"
          "    return max(leftHeight, rightHeight);\n"
          "}\n"
          "```",
      "options": [
        "It does not include the root level",
        "It does not handle empty trees",
        "Logic for height calculation is incorrect",
        "Function should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What mistake exists in the function to find the minimum value in BST?\n\n"
              "```cpp\n"
              "int findMin(Node* root) {\n"
              "    if (root == nullptr) return -1;\n"
              "    while (root->left != nullptr) {\n"
              "        root = root->left;\n"
              "    }\n"
              "    delete root;\n"
              "    return root->data;\n"
              "}\n"
              "```",
      "options": [
        "It deletes the minimum node incorrectly",
        "It does not find the minimum value",
        "Function should return void",
        "It should return a Node*"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the issue in this tree balancing function:\n\n"
          "```cpp\n"
          "Node* balanceTree(Node* root) {\n"
          "    if (root == nullptr) return root;\n"
          "    root->left = balanceTree(root->right);\n"
          "    root->right = balanceTree(root->left);\n"
          "    return root;\n"
          "}\n"
          "```",
      "options": [
        "It swaps left and right incorrectly",
        "It does not balance the tree",
        "Logic is completely incorrect",
        "Memory leak occurs"
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
        title: const Text("Tree Quiz",
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
