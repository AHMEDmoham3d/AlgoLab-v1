// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PrintfPage extends StatefulWidget {
  const PrintfPage({super.key});

  @override
  _PrintfPageState createState() => _PrintfPageState();
}

class _PrintfPageState extends State<PrintfPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What will be the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%d %d\", 10);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["10", "Compilation error", "Undefined behavior", "10 0"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the error in the following C program:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%c\", 65.5);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Prints A",
        "Compilation error",
        "Undefined behavior",
        "Runtime error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What will be the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%d\", 'A');\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["A", "Compilation error", "65", "Undefined behavior"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the mistake in this C program?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%s\", 'Hello');\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Prints Hello",
        "Segmentation fault",
        "Compilation error",
        "Undefined behavior"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%d %d\", 5.5, 10);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["5 10", "Compilation error", "Undefined behavior", "5.5 10"],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What will happen when the following C program is executed?\n\n"
              "```c\n"
              "#include <stdio.h>\n\n"
              "int main() {\n"
              "    printf(\"%f\", 5);\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": [
        "Prints 5.000000",
        "Compilation error",
        "Undefined behavior",
        "Prints 5"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Find the issue in this C program:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%d\", \"100\");\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Prints 100",
        "Segmentation fault",
        "Compilation error",
        "Undefined behavior"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What will be the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    printf(\"%c\", 100.0);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Prints d",
        "Compilation error",
        "Undefined behavior",
        "Prints 100"
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
        title: const Text("Printf Quiz",
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
