// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class WhileCPage extends StatefulWidget {
  const WhileCPage({super.key});

  @override
  _WhileCPageState createState() => _WhileCPageState();
}

class _WhileCPageState extends State<WhileCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int i = 0;\n"
          "    while i < 5 {\n"
          "        printf(\"%d \", i);\n"
          "        i++;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The condition must be inside parentheses ()",
        "Variable i is not defined",
        "The code is correct and has no errors",
        "while should be replaced with for"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int x = 10;\n"
          "    while (x > 0);\n"
          "    {\n"
          "        printf(\"%d \", x);\n"
          "        x--;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Using a semicolon after while causes an unwanted loop",
        "Variable x should be float",
        "Missing return 0",
        "while cannot be used in this way"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int n = 1;\n"
          "    while (n < 10) {\n"
          "        printf(\"%d \", n);\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "No exit condition for the loop",
        "Incorrect use of printf",
        "The code has no errors",
        "while should be replaced with do-while"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int i = 0;\n"
          "    while (i < 3)\n"
          "        printf(\"%d \", i);\n"
          "        i++;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Missing curly braces {} causes an issue",
        "Variable i is not defined",
        "The loop does not work correctly",
        "for should be used instead of while"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int i = 5;\n"
          "    while (i = 0) {\n"
          "        printf(\"%d \", i);\n"
          "        i--;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Should use == instead of = in the condition",
        "Variable i is not defined",
        "The code has no errors",
        "while cannot handle negative values"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int i;\n"
          "    while (i < 5) {\n"
          "        printf(\"%d \", i);\n"
          "        i++;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Variable i is not initialized",
        "The code runs correctly",
        "Incorrect use of while",
        "return 1 should be used instead of return 0"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int i = 0;\n"
          "    while (i < 5) {\n"
          "        printf(\"%d \", i);\n"
          "        i = i + 0;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The loop never ends because i does not change",
        "Incorrect use of printf",
        "while should not have a condition",
        "for should be used instead of while"
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
        title: const Text("while Quiz",
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
