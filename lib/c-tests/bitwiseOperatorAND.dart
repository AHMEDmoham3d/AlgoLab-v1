// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class bitwiseOperatorANDPage extends StatefulWidget {
  const bitwiseOperatorANDPage({super.key});

  @override
  _bitwiseOperatorANDPageState createState() => _bitwiseOperatorANDPageState();
}

// ignore: camel_case_types
class _bitwiseOperatorANDPageState extends State<bitwiseOperatorANDPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5;\n"
          "    int b = 3;\n"
          "    printf(\"%d\", a & b); // Expected output: 1\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Missing semicolon",
        "Incorrect use of bitwise AND",
        "No error in the code",
        "Incorrect format specifier"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Identify the mistake in this bitwise AND operation:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 8;\n"
          "    int y = 4;\n"
          "    printf(\"Bitwise AND: %d\", x && y);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Incorrect use of logical AND (&&) instead of bitwise AND (&)",
        "Missing return statement",
        "Incorrect format specifier",
        "No mistake in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in this bitwise AND operation:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 10, b = 6;\n"
          "    int result = a & b;\n"
          "    printf(\"Result: %f\", result);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Using %f instead of %d for integer output",
        "Bitwise AND operator is incorrect",
        "Result variable is uninitialized",
        "No error in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Spot the error in this bitwise AND operation:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int num = 7;\n"
          "    if (num & 1 = 0) {\n"
          "        printf(\"Even number\");\n"
          "    } else {\n"
          "        printf(\"Odd number\");\n"
          "    }\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Assignment operator (=) used instead of comparison (==)",
        "Incorrect format specifier",
        "Bitwise AND should be logical AND",
        "No error in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the mistake in the following C program?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    unsigned char x = 0b1010;\n"
          "    unsigned char y = 0b1100;\n"
          "    unsigned char result = x & y;\n"
          "    printf(\"Result: %d\", result);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Binary literals are not valid in standard C",
        "Incorrect format specifier",
        "Bitwise AND cannot be used on chars",
        "No error in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the bug in this bitwise operation:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5, b = 3;\n"
          "    printf(\"Bitwise AND: \");\n"
          "    printf(a & b);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Incorrect use of printf (missing format specifier)",
        "Bitwise AND operator is incorrect",
        "Wrong variable names",
        "No error in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the mistake in this C code:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int bitwiseAND(int a, int b) {\n"
          "    return a & b;\n"
          "}\n"
          "int main() {\n"
          "    printf(\"%d\", bitwiseAND(5));\n"
          "    return 0;\n"
          "}```",
      "options": [
        "bitwiseAND function is missing a parameter",
        "Incorrect format specifier",
        "Bitwise AND cannot be used inside a function",
        "No error in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the mistake in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int result = 10 & 4.5;\n"
          "    printf(\"%d\", result);\n"
          "    return 0;\n"
          "}```",
      "options": [
        "Bitwise AND cannot be used between an integer and a float",
        "Incorrect use of printf",
        "Bitwise AND should be logical AND",
        "No error in the code"
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
        title: const Text("Bitwise AND Quiz",
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
