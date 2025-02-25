// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class bitwiseOperatorORPage extends StatefulWidget {
  const bitwiseOperatorORPage({super.key});

  @override
  _bitwiseOperatorORPageState createState() => _bitwiseOperatorORPageState();
}

// ignore: camel_case_types
class _bitwiseOperatorORPageState extends State<bitwiseOperatorORPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5;\n"
          "    int b = 3;\n"
          "    printf(\"%d\", a || b);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Incorrect use of logical OR (||) instead of bitwise OR (|)",
        "Incorrect format specifier",
        "Missing semicolon",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 8 |;\n"
          "    printf(\"%d\", x);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Unexpected '|' at the end of expression",
        "Incorrect format specifier",
        "Missing return statement",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with this bitwise OR operation?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 6;\n"
          "    char b = '2';\n"
          "    int result = a | b;\n"
          "    printf(\"%d\", result);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Character '2' is incorrectly used in bitwise OR",
        "Missing semicolon",
        "Incorrect format specifier",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in this code snippet:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 5, y = 10;\n"
          "    int z = x | y;\n"
          "    printf(\"Bitwise OR: %f\", z);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Incorrect format specifier (should be %d instead of %f)",
        "Bitwise OR cannot be used on integers",
        "Missing return statement",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the problem in this code:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int num = 3 | 5 |;\n"
          "    printf(\"%d\", num);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Unexpected '|' at the end of the expression",
        "Incorrect format specifier",
        "Incorrect variable declaration",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 9;\n"
          "    float b = 2.5;\n"
          "    printf(\"%d\", a | b);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Bitwise OR cannot be used with float values",
        "Incorrect format specifier",
        "Missing semicolon",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the mistake in this bitwise OR operation:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 4, b = 2;\n"
          "    printf(\"Bitwise OR: %d\", a | b |);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Unexpected '|' at the end of the expression",
        "Incorrect use of bitwise OR",
        "Incorrect format specifier",
        "No mistake"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is incorrect in this C program?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 5;\n"
          "    int y = x | 2;\n"
          "    printf(\"%f\", y);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Incorrect format specifier (should be %d instead of %f)",
        "Incorrect bitwise OR usage",
        "Missing return statement",
        "No mistake"
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
        title: const Text("Bitwise Operator OR Quiz",
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
