// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HexadecimalCPage extends StatefulWidget {
  const HexadecimalCPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HexadecimalCPageState createState() => _HexadecimalCPageState();
}

class _HexadecimalCPageState extends State<HexadecimalCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int num = 0xG4;\n"
          "    printf(\"%d\\n\", num);\n"
          "    return 0;\n"
          "}"
          "```",
      "options": [
        "Invalid hexadecimal number",
        "Missing semicolon",
        "Incorrect printf format specifier",
        "Hexadecimal numbers must start with 0b"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int num = 0xA1;\n"
          "    printf(\"%x\", num);\n"
          "    return 0;\n"
          "}"
          "```",
      "options": [
        "%x should be replaced with %d",
        "No error, the code is correct",
        "Hexadecimal values cannot be printed",
        "Integer variables cannot store hexadecimal values"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    char hex[] = \"0x1F\";\n"
          "    int num = atoi(hex);\n"
          "    printf(\"%d\\n\", num);\n"
          "    return 0;\n"
          "}"
          "```",
      "options": [
        "Hexadecimal numbers cannot be stored as strings",
        "atoi() does not work with hexadecimal values",
        "%d should be replaced with %x",
        "Missing return statement"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int num = 0xZ2;\n"
          "    printf(\"%d\\n\", num);\n"
          "    return 0;\n"
          "}"
          "```",
      "options": [
        "Invalid hexadecimal digit",
        "0x should be replaced with 0b",
        "num should be declared as char",
        "printf should use %x instead of %d"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int num = 0x1F;\n"
          "    printf(\"%d %d\", num, num);\n"
          "    return 0;\n"
          "}"
          "```",
      "options": [
        "No error, the code is correct",
        "%d should be replaced with %x",
        "Hexadecimal values cannot be printed",
        "int cannot store hexadecimal numbers"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int num = 0xFF;\n"
          "    printf(\"%X\", num);\n"
          "    return 0;\n"
          "}"
          "```",
      "options": [
        "%X should be replaced with %d",
        "No error, the code is correct",
        "Hexadecimal numbers cannot be assigned to int",
        "printf() cannot print hexadecimal numbers"
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
        title: const Text("hexadecimal Quiz",
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
