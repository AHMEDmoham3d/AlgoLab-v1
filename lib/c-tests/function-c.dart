// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FunctionCPage extends StatefulWidget {
  const FunctionCPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FunctionCPageState createState() => _FunctionCPageState();
}

class _FunctionCPageState extends State<FunctionCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "void add(int a, int b);\n\n"
          "int main() {\n"
          "    add(5, 10);\n"
          "    return 0;\n"
          "}\n\n"
          "void add(int a, int b) {\n"
          "    return a + b;\n"
          "}\n"
          "```",
      "options": [
        "The function should return an int value",
        "Missing semicolon",
        "Function declaration is incorrect",
        "Functions in C cannot take parameters"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "void printMessage() {\n"
          "    printf(\"Hello, World!\\n\");\n"
          "}\n\n"
          "int main() {\n"
          "    printMessage;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "printMessage should be called with parentheses",
        "Functions cannot be called inside main",
        "printf should not be used inside functions",
        "C does not support functions"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int multiply(int a, int b);\n\n"
          "int main() {\n"
          "    int result = multiply(3, 4);\n"
          "    printf(\"%d\\n\", result);\n"
          "    return 0;\n"
          "}\n\n"
          "int multiply(int a, int b) {\n"
          "    printf(\"Multiplying...\\n\");\n"
          "}\n"
          "```",
      "options": [
        "Function multiply does not return a value",
        "int is not a valid return type",
        "printf cannot be inside a function",
        "C functions cannot return integers"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int divide(int a, int b) {\n"
          "    return a / b;\n"
          "}\n\n"
          "int main() {\n"
          "    int result = divide(10, 0);\n"
          "    printf(\"%d\\n\", result);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Division by zero is undefined behavior",
        "divide function should return void",
        "C does not support division",
        "printf cannot print integer values"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n\n"
          "int square(int x);\n\n"
          "int main() {\n"
          "    printf(\"%d\\n\", square(5));\n"
          "    return 0;\n"
          "}\n\n"
          "int square(int x) {\n"
          "    int x = x * x;\n"
          "    return x;\n"
          "}\n"
          "```",
      "options": [
        "Variable x is redeclared inside square function",
        "square function should return void",
        "C functions cannot modify parameters",
        "printf cannot print function results"
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
        title: const Text("Function C Quiz",
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
                      Text(
                        questions[currentQuestionIndex]["question"],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: List.generate(
                          questions[currentQuestionIndex]["options"].length,
                          (optionIndex) {
                            return ElevatedButton(
                              onPressed: () => selectAnswer(optionIndex),
                              child: Text(questions[currentQuestionIndex]
                                  ["options"][optionIndex]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: nextQuestion,
                        child: const Text("Next"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
