// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ASCIICPage extends StatefulWidget {
  const ASCIICPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ASCIICPageState createState() => _ASCIICPageState();
}

class _ASCIICPageState extends State<ASCIICPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = 65;\n"
          "    printf(\"%c\", ch);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Should use 'char' instead of integer",
        "Missing semicolon",
        "No error, prints 'A'",
        "Invalid ASCII conversion"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = 'B' + 1;\n"
          "    printf(\"%c\", ch);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Should use ASCII function instead",
        "No error, prints 'C'",
        "Characters cannot be incremented",
        "Incorrect printf format"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = 256;\n"
          "    printf(\"%d\", ch);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Char cannot store 256",
        "No error, prints 0",
        "Overflow occurs",
        "Should use int instead of char"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = '\\101';\n"
          "    printf(\"%c\", ch);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Octal ASCII values are not allowed",
        "No error, prints 'A'",
        "Incorrect escape sequence",
        "Should use hexadecimal instead"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = '\\x41';\n"
          "    printf(\"%c\", ch);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Hexadecimal ASCII values are not allowed",
        "No error, prints 'A'",
        "Should use decimal instead",
        "Invalid character assignment"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char ch = 'Z' + 1;\n"
          "    printf(\"%c\", ch);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Characters cannot be incremented",
        "No error, prints '['",
        "Invalid ASCII operation",
        "Overflow occurs"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    printf(\"%d\", '\\n');\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["10", "13", "Error", "Undefined"],
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
        title: const Text("ASCII Quiz",
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
