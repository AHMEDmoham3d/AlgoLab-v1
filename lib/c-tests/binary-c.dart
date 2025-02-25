// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class BinaryCPage extends StatefulWidget {
  const BinaryCPage({super.key});

  @override
  _BinaryCPageState createState() => _BinaryCPageState();
}

class _BinaryCPageState extends State<BinaryCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 5 >> 2.5;\n"
          "    printf(\"%d\", x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Shift amount must be an integer",
        "Missing semicolon",
        "Right shift is not allowed",
        "printf format specifier is incorrect"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5 & 3;\n"
          "    printf(\"%f\", a);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Bitwise AND cannot be used with integers",
        "Incorrect printf format specifier",
        "Variables must be declared at the beginning",
        "Missing return statement"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    unsigned int x = -5;\n"
          "    printf(\"%u\", x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Negative value assigned to unsigned int",
        "printf format specifier is incorrect",
        "Unsigned int must be positive",
        "Missing return statement"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 5 | 2;\n"
          "    printf(\"%d\", x);\n"
          "    return;\n"
          "}\n"
          "```",
      "options": [
        "Bitwise OR is not allowed",
        "printf format specifier is incorrect",
        "main must return an integer",
        "Missing semicolon"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 10;\n"
          "    int b = ~a;\n"
          "    printf(\"%d\", b);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Bitwise NOT cannot be used on integers",
        "printf format specifier is incorrect",
        "Bitwise NOT returns a negative value",
        "No error in this code"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 8 << -1;\n"
          "    printf(\"%d\", x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Left shift amount must be non-negative",
        "printf format specifier is incorrect",
        "Left shift is not allowed",
        "Missing semicolon"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 5 ^ 3.0;\n"
          "    printf(\"%d\", x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "XOR operator cannot be used with float",
        "printf format specifier is incorrect",
        "Bitwise XOR is not allowed",
        "No error in this code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int x = 10;\n"
          "    x <<= 33;\n"
          "    printf(\"%d\", x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Left shift exceeds integer size",
        "printf format specifier is incorrect",
        "Left shift is not allowed",
        "No error in this code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5, b = 2;\n"
          "    int c = a && b;\n"
          "    printf(\"%d\", c);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Logical AND cannot be used with integers",
        "printf format specifier is incorrect",
        "Logical AND returns 0 or 1",
        "No error in this code"
      ],
      "answer": 3,
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
        title: const Text("Binary C Quiz",
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
