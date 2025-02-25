// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class VariablesCPage extends StatefulWidget {
  const VariablesCPage({super.key});

  @override
  _VariablesCPageState createState() => _VariablesCPageState();
}

class _VariablesCPageState extends State<VariablesCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int 5x = 10;\n"
          "    printf(\"%d\", 5x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Variable name cannot start with a number",
        "Missing semicolon",
        "Incorrect format specifier",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in this C code:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    float num = 5.5;\n"
          "    printf(\"%d\", num);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Incorrect format specifier",
        "Float should be declared as int",
        "Printf function is incorrect",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the mistake in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    char c = 'AB';\n"
          "    printf(\"%c\", c);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Character variable can only store one character",
        "Wrong format specifier",
        "Incorrect use of printf",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the error in this C program:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int a = 10, b = 0;\n"
          "    int result = a / b;\n"
          "    printf(\"%d\", result);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Division by zero error",
        "Incorrect variable type",
        "Incorrect printf function",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Where is the mistake in this C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int arr[5] = {1, 2, 3, 4, 5};\n"
          "    printf(\"%d\", arr[5]);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Array index out of bounds",
        "Incorrect printf function",
        "Array should be of type float",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem in this C program?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    int x;\n"
          "    printf(\"%d\", x);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Using an uninitialized variable",
        "Wrong format specifier",
        "Incorrect printf function",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the error in this C code:\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int main() {\n"
          "    const int num = 10;\n"
          "    num = 20;\n"
          "    printf(\"%d\", num);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Cannot modify a constant variable",
        "Incorrect printf function",
        "Wrong format specifier",
        "No error"
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
        title: const Text("Variables Quiz",
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
