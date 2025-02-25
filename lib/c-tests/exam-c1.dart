// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class Exam1cPage extends StatefulWidget {
  const Exam1cPage({super.key});

  @override
  _Exam1cPageState createState() => _Exam1cPageState();
}

class _Exam1cPageState extends State<Exam1cPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x;\n"
          "    scanf(\"%d\"); // Missing variable to store input\n"
          "    return 0;\n"
          "}\n",
      "options": [
        "Missing variable in scanf",
        "printf statement missing",
        "No return statement",
        "int type cannot be used in scanf"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    printf(\"Hello World\"); // Missing newline\n"
          "    return 0;\n"
          "}\n",
      "options": [
        "No semicolon after printf",
        "No return statement",
        "Missing \n in printf",
        "Syntax error in printf"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5;\n"
          "    if (a = 10) { // Should be '==' instead of '='\n"
          "        printf(\"A is 10\");\n"
          "    }\n"
          "    return 0;\n"
          "}\n",
      "options": [
        "Assignment operator used instead of comparison",
        "Missing semicolon",
        "No printf statement",
        "return statement is missing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What will be the output of the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5, b = 2;\n"
          "    printf(\"%d\", a / b);\n"
          "    return 0;\n"
          "}\n",
      "options": ["2.5", "2", "Compiler error", "Runtime error"],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "Which header file is needed to use the 'malloc' function in C?",
      "options": ["<stdio.h>", "<stdlib.h>", "<string.h>", "<math.h>"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int arr[5];\n"
          "    arr[5] = 10; // Out of bounds error\n"
          "    return 0;\n"
          "}\n",
      "options": [
        "Accessing out-of-bounds array index",
        "Arrays cannot store values",
        "Array size must be variable",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the output of the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = 'A';\n"
          "    printf(\"%d\", ch);\n"
          "    return 0;\n"
          "}\n",
      "options": ["A", "65", "Print error", "Nothing prints"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the output of the following C code?\n\n"
          "#include <stdio.h>\n"
          "void func() {\n"
          "    static int count = 0;\n"
          "    count++;\n"
          "    printf(\"%d \", count);\n"
          "}\n"
          "int main() {\n"
          "    func();\n"
          "    func();\n"
          "    func();\n"
          "    return 0;\n"
          "}\n",
      "options": ["1 1 1", "1 2 3", "Execution error", "0 1 2"],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the default return type of a function in C if not specified?",
      "options": ["int", "void", "float", "char"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int *ptr;\n"
          "    *ptr = 10; // Uninitialized pointer usage\n"
          "    printf(\"%d\", *ptr);\n"
          "    return 0;\n"
          "}\n",
      "options": [
        "No error",
        "Pointer not initialized",
        "Cannot print pointer value",
        "Error in printf"
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
        title: const Text("Exam Quiz",
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
