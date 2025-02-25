// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Find the error in the following C++ class definition:\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "class Test {\n"
          "    int x;\n"
          "    void show();\n"
          "};\n\n"
          "void Test::show() {\n"
          "    cout << x << endl;\n"
          "}\n\n"
          "int main() {\n"
          "    Test obj;\n"
          "    obj.show();\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Missing constructor",
        "Function `show` is private",
        "Member variable `x` is uninitialized",
        "Syntax error in class definition"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the error in the following C++ program:\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "class Demo {\n"
          "public:\n"
          "    int num;\n"
          "    Demo(int n) {\n"
          "        num = n;\n"
          "    }\n"
          "};\n\n"
          "int main() {\n"
          "    Demo obj;\n"
          "    cout << obj.num << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Class must have a destructor",
        "Constructor must have a return type",
        "Object `obj` must be initialized with a value",
        "Data member `num` must be private"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the mistake in this C++ code snippet:\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "class Sample {\n"
          "    int a;\n"
          "public:\n"
          "    Sample() { a = 10; }\n"
          "    void display() {\n"
          "        cout << a << endl;\n"
          "    }\n"
          "};\n\n"
          "int main() {\n"
          "    Sample* ptr = new Sample;\n"
          "    delete ptr;\n"
          "    ptr->display();\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak in the program",
        "Accessing a deleted object",
        "Constructor missing",
        "Syntax error in destructor"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Identify the issue in this C++ class implementation:\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "class MyClass {\n"
          "    int value;\n"
          "public:\n"
          "    MyClass(int v) { value = v; }\n"
          "    void display() {\n"
          "        cout << value << endl;\n"
          "    }\n"
          "};\n\n"
          "int main() {\n"
          "    MyClass obj1, obj2(10);\n"
          "    obj1.display();\n"
          "    obj2.display();\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Constructor must initialize all variables",
        "Object `obj1` is not initialized properly",
        "Class must have a destructor",
        "Function `display` should be static"
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
        title: const Text("Class Quiz",
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
