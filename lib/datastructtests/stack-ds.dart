// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  const StackPage({super.key});

  @override
  _stackPageState createState() => _stackPageState();
}

// ignore: camel_case_types
class _stackPageState extends State<StackPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following stack implementation?\n\n"
          "```dart\n"
          "class Stack {\n"
          "  List<int> stack = [];\n"
          "\n"
          "  void push(int value) {\n"
          "    stack.add(value);\n"
          "  }\n"
          "\n"
          "  int pop() {\n"
          "    return stack.removeLast();\n"
          "  }\n"
          "}\n"
          "\n"
          "void main() {\n"
          "  Stack s = Stack();\n"
          "  s.pop(); // Error\n"
          "}\n"
          "```",
      "options": [
        "Stack underflow error",
        "Push function is incorrect",
        "Pop does not remove elements",
        "List should be a fixed size"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the bug in the stack class below:\n\n"
          "```dart\n"
          "class Stack {\n"
          "  List<int> stack = [];\n"
          "\n"
          "  void push(int value) {\n"
          "    stack.add(value);\n"
          "  }\n"
          "\n"
          "  int pop() {\n"
          "    return stack[stack.length]; // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Out of bounds index",
        "Push does not work",
        "Stack is not initialized",
        "List should use a queue"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem with this stack implementation?\n\n"
          "```dart\n"
          "class Stack {\n"
          "  List<int> stack = [];\n"
          "  int top = -1;\n"
          "\n"
          "  void push(int value) {\n"
          "    top++;\n"
          "    stack[top] = value; // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Stack is not initialized properly",
        "Index out of bounds error",
        "Push function does not work",
        "Stack overflow error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is wrong in the stack pop function?\n\n"
          "```dart\n"
          "class Stack {\n"
          "  List<int> stack = [];\n"
          "\n"
          "  void push(int value) {\n"
          "    stack.add(value);\n"
          "  }\n"
          "\n"
          "  int pop() {\n"
          "    if (stack.isEmpty) {\n"
          "      return -1; // Error\n"
          "    }\n"
          "    return stack.removeLast();\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Stack underflow is not handled properly",
        "Push does not add elements",
        "Pop does not remove elements",
        "Return type is incorrect"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What mistake is present in the stack class below?\n\n"
          "```dart\n"
          "class Stack {\n"
          "  List<int> stack = [];\n"
          "\n"
          "  void push(int value) {\n"
          "    stack.insert(0, value); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "Insertion should be at the end",
        "Push does not work",
        "Stack is not initialized",
        "List should have a max size"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the issue in this stack implementation:\n\n"
          "```dart\n"
          "class Stack {\n"
          "  List<int> stack;\n"
          "\n"
          "  Stack() {\n"
          "    stack.add(0); // Error\n"
          "  }\n"
          "}\n"
          "```",
      "options": [
        "List is not initialized",
        "Stack is empty",
        "Push function is missing",
        "Pop function is missing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the problem with this implementation of stack peek?\n\n"
              "```dart\n"
              "class Stack {\n"
              "  List<int> stack = [];\n"
              "\n"
              "  int peek() {\n"
              "    return stack.last; // Error\n"
              "  }\n"
              "}\n"
              "```",
      "options": [
        "Peek does not check if the stack is empty",
        "Peek should remove the element",
        "Peek should return index 0",
        "Peek is not needed in stacks"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the logical error in the following stack function?\n\n"
              "```dart\n"
              "class Stack {\n"
              "  List<int> stack = [];\n"
              "\n"
              "  void push(int value) {\n"
              "    stack[stack.length] = value; // Error\n"
              "  }\n"
              "}\n"
              "```",
      "options": [
        "Index out of bounds",
        "Stack overflow",
        "Push does not work",
        "Stack is empty"
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
        title: const Text("Stack Quiz",
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
