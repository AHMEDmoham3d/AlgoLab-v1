// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class CallocPage extends StatefulWidget {
  const CallocPage({super.key});

  @override
  _CallocPageState createState() => _CallocPageState();
}

class _CallocPageState extends State<CallocPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "    arr[5] = 10;\n"
          "    printf(\"%d\", arr[5]);\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Accessing memory out of allocated bounds",
        "Memory leak due to missing free()",
        "calloc does not initialize memory",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "    if (!arr) {\n"
          "        printf(\"Memory allocation failed!\");\n"
          "    }\n"
          "    arr[2] = 10;\n"
          "    printf(\"%d\", arr[2]);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak: missing free()",
        "Invalid syntax for calloc",
        "Array indexing error",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the problem in this C code using calloc?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr;\n"
          "    arr = (int*) calloc(0, sizeof(int));\n"
          "    if (arr) {\n"
          "        printf(\"Memory allocated successfully\");\n"
          "    } else {\n"
          "        printf(\"Memory allocation failed\");\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "calloc(0, size) may return NULL or a valid pointer",
        "Incorrect syntax for calloc",
        "Memory leak",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the bug in the following C code:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "    free(arr);\n"
          "    printf(\"%d\", arr[0]);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Using freed memory (dangling pointer)",
        "Memory leak",
        "Incorrect calloc syntax",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What will happen if you run this C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "    free(arr);\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Double free error (undefined behavior)",
        "Memory leak",
        "calloc syntax error",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with this code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "    if (!arr) {\n"
          "        printf(\"Memory allocation failed!\");\n"
          "        return 1;\n"
          "    }\n"
          "    arr = calloc(10, sizeof(int));\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak due to reallocation without free()",
        "calloc syntax error",
        "Undefined behavior due to accessing NULL",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the mistake in this C code:\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "    for (int i = 0; i <= 5; i++) {\n"
          "        arr[i] = i * 2;\n"
          "    }\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Accessing memory out of allocated bounds",
        "calloc does not initialize memory",
        "Memory leak",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong in the following code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "void func() {\n"
          "    int *arr = calloc(5, sizeof(int));\n"
          "}\n\n"
          "int main() {\n"
          "    func();\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak: allocated memory not freed",
        "Function should return pointer",
        "calloc does not work inside functions",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in this code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr;\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Freeing uninitialized pointer (undefined behavior)",
        "Memory leak",
        "Incorrect calloc syntax",
        "No error, the code is correct"
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
        title: const Text("Calloc Quiz",
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
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: allCorrect ? goBack : resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: allCorrect ? Colors.green : Colors.red,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
