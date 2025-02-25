// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ReallocPage extends StatefulWidget {
  const ReallocPage({super.key});

  @override
  _ReallocPageState createState() => _ReallocPageState();
}

class _ReallocPageState extends State<ReallocPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    ptr = (int*) realloc(ptr, 0);\n"
          "    ptr[0] = 10;\n"
          "    printf(\"%d\", ptr[0]);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "realloc with size 0 deallocates memory, accessing ptr is undefined behavior",
        "ptr[0] is not assigned correctly",
        "Memory is not allocated properly",
        "There is no error in the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = NULL;\n"
          "    ptr = realloc(ptr, 5 * sizeof(int));\n"
          "    if (!ptr) {\n"
          "        printf(\"Memory allocation failed\");\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Using realloc with NULL is incorrect",
        "Memory allocation should be checked before using realloc",
        "No error, the code is correct",
        "ptr should not be assigned directly from realloc"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    int *temp = realloc(ptr, 10 * sizeof(int));\n"
          "    if (temp == NULL) {\n"
          "        free(ptr);\n"
          "    }\n"
          "    ptr = temp;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak if realloc fails",
        "Using malloc before realloc is wrong",
        "Memory should not be freed in case of realloc failure",
        "Realloc cannot resize memory"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    ptr = realloc(ptr, -1);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Negative size causes undefined behavior",
        "realloc should not be used after malloc",
        "ptr should be freed before calling realloc",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr;\n"
          "    ptr = realloc(ptr, 5 * sizeof(int));\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Using realloc on an uninitialized pointer causes undefined behavior",
        "ptr should be assigned before calling realloc",
        "No error, the code is correct",
        "realloc cannot be used without malloc first"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    free(ptr);\n"
          "    ptr = realloc(ptr, 10 * sizeof(int));\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Using realloc on a freed pointer causes undefined behavior",
        "ptr should be freed before realloc",
        "Memory leak occurs if realloc fails",
        "No error, the code is correct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    ptr = realloc(ptr, 10);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Realloc size should be a multiple of sizeof(int)",
        "realloc should not be used after malloc",
        "No error, the code is correct",
        "Realloc must return the same pointer address"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    ptr = realloc(ptr, 100000000000);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory allocation failure due to large size",
        "ptr should be freed before calling realloc",
        "No error, the code is correct",
        "Realloc should not be used with malloc"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    realloc(ptr, 10 * sizeof(int));\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Not storing realloc return value may cause a memory leak",
        "Realloc cannot resize memory",
        "No error, the code is correct",
        "Memory should be freed before realloc"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*) malloc(5 * sizeof(int));\n"
          "    ptr = realloc(ptr, sizeof(int) * -5);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Negative size causes undefined behavior",
        "Realloc must be used with a valid pointer",
        "No error, the code is correct",
        "Realloc should not be used after malloc"
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
        title: const Text("Set Quiz",
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
