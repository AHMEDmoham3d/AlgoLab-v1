// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class SwitchCPage extends StatefulWidget {
  const SwitchCPage({super.key});

  @override
  _SwitchCPageState createState() => _SwitchCPageState();
}

class _SwitchCPageState extends State<SwitchCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int num = 2;\n"
          "    switch (num) {\n"
          "        case 1:\n"
          "            printf(\"One\");\n"
          "        case 2:\n"
          "            printf(\"Two\");\n"
          "        case 3:\n"
          "            printf(\"Three\");\n"
          "        default:\n"
          "            printf(\"Default\");\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Missing break statements, causing fall-through",
        "Syntax error in switch statement",
        "Incorrect use of printf",
        "Missing semicolon after case labels"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in the following C program:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int x = 5;\n"
          "    switch (x) {\n"
          "        case 5:\n"
          "            printf(\"Five\");\n"
          "            break;\n"
          "        case 10:\n"
          "            printf(\"Ten\");\n"
          "            break;\n"
          "        x = 15;\n"
          "            printf(\"Fifteen\");\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Assignment inside switch is invalid",
        "Break statement is missing",
        "Case labels should be inside brackets",
        "Default case is missing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the mistake in the given C code:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    char grade = 'B';\n"
          "    switch (grade) {\n"
          "        case 'A':\n"
          "            printf(\"Excellent\");\n"
          "        case 'B':\n"
          "            printf(\"Good\");\n"
          "            break;\n"
          "        case 'C':\n"
          "            printf(\"Average\");\n"
          "            break;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Missing break statement after 'A'",
        "Incorrect use of char in switch",
        "Switch cannot use character values",
        "Case labels should have colons"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    float num = 2.5;\n"
          "    switch (num) {\n"
          "        case 1.5:\n"
          "            printf(\"One and a half\");\n"
          "            break;\n"
          "        case 2.5:\n"
          "            printf(\"Two and a half\");\n"
          "            break;\n"
          "        default:\n"
          "            printf(\"Default case\");\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Switch cases cannot have floating-point values",
        "Break statements are missing",
        "Syntax error in case labels",
        "Printf function is used incorrectly"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following C program?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int value = 10;\n"
          "    switch (value) {\n"
          "        case 5:\n"
          "            printf(\"Five\");\n"
          "        case 10;\n"
          "            printf(\"Ten\");\n"
          "        case 15:\n"
          "            printf(\"Fifteen\");\n"
          "            break;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Missing break statements before case 10",
        "Switch should be inside a loop",
        "Printf should use format specifiers",
        "Default case is missing"
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
        title: const Text("Switch Statement Quiz",
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
