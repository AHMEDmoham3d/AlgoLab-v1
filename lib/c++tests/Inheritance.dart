// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class InheritancePage extends StatefulWidget {
  const InheritancePage({super.key});

  @override
  _InheritancePageState createState() => _InheritancePageState();
}

class _InheritancePageState extends State<InheritancePage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the output of the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "class Base {\n"
          "public:\n"
          " void show() {\n \ncout << \"Base\";\n }\n"
          "};\n"
          "class Derived : public Base {};\n\n"
          "int main() {\n"
          "    Derived d;\n"
          "    d.show();\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["Base", "Derived", "Compiler Error", "Runtime Error"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "class A {\n"
          "  int x;\n"
          "};\n"
          "class B : A {\n"
          "  int y;\n"
          "};",
      "options": [
        "Inheritance should be 'public A'",
        "Missing constructor in class B",
        "Class A should have public members",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in the following C++ code:\n\n"
          "class Base {\n"
          "  private:\n"
          "    int x;\n"
          "};\n"
          "class Derived : public Base {\n"
          "  public:\n"
          "    void show() { cout << x; }\n"
          "};",
      "options": [
        "x is inaccessible in Derived",
        "show() function is not defined",
        "Base class should be public",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem in this C++ code?\n\n"
          "class A {\n"
          "  A() {}\n"
          "};\n"
          "class B : public A {\n"
          "  int y;\n"
          "};",
      "options": [
        "Base class constructor is private",
        "y should be initialized",
        "B should override A()",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the error in the following C++ code:\n\n"
          "class A {\n"
          "  public:\n"
          "    virtual void show() = 0;\n"
          "};\n"
          "class B : public A {\n"
          "  void display() { cout << 'Hello'; }\n"
          "};",
      "options": [
        "B must implement 'show()'",
        "display() should be virtual",
        "A cannot have a pure virtual function",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in the following code:\n\n"
          "class A {\n"
          "  public:\n"
          "    A(int x) {}\n"
          "};\n"
          "class B : public A {\n"
          "  public:\n"
          "    B() {}\n"
          "};",
      "options": [
        "B must explicitly call A(int x)",
        "x should be initialized in A",
        "B should be abstract",
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
        title: const Text("Inheritance Quiz",
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
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: allCorrect ? goBack : resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: allCorrect ? Colors.green : Colors.red,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
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
                                padding: const EdgeInsets.symmetric(vertical: 16),
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
