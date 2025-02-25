// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PointerPage extends StatefulWidget {
  const PointerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PointerPageState createState() => _PointerPageState();
}

class _PointerPageState extends State<PointerPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 10;\n"
          "    int *ptr = &a;\n"
          "    *ptr = 20;\n"
          "    printf(\"%d\", ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Dereferencing a pointer instead of printing the value",
        "Invalid pointer assignment",
        "Incorrect usage of the printf function",
        "The pointer should be printed using *ptr"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int *ptr;\n"
          "    *ptr = 10;\n"
          "    printf(\"%d\", *ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Uninitialized pointer",
        "Pointer dereferencing without memory allocation",
        "Memory leak",
        "The pointer should be initialized before dereferencing"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5;\n"
          "    int *ptr = &a;\n"
          "    *ptr = 10;\n"
          "    ptr = NULL;\n"
          "    printf(\"%d\", *ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Dereferencing a NULL pointer",
        "Memory allocation error",
        "Pointer should not be set to NULL after use",
        "Incorrect pointer dereferencing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int *ptr = malloc(sizeof(int));\n"
          "    *ptr = 20;\n"
          "    printf(\"%d\", ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak",
        "Incorrect pointer dereferencing",
        "Dereferencing without checking if malloc succeeded",
        "Memory allocation function not properly used"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int arr[] = {1, 2, 3, 4};\n"
          "    int *ptr = arr;\n"
          "    printf(\"%d\", *(ptr+4));\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Out of bounds array access",
        "Dereferencing an uninitialized pointer",
        "Incorrect pointer arithmetic",
        "Array out of memory"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int *ptr = 10;\n"
          "    printf(\"%d\", *ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Assigning a literal to a pointer",
        "Dereferencing an uninitialized pointer",
        "Invalid pointer type",
        "Incorrect dereferencing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int a = 5;\n"
          "    int *ptr = &a;\n"
          "    ptr++;\n"
          "    printf(\"%d\", *ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Pointer increment leading to undefined behavior",
        "Dereferencing an invalid pointer",
        "Incorrect pointer arithmetic",
        "Pointer overflow"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int *ptr = NULL;\n"
          "    printf(\"%d\", *ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Dereferencing a NULL pointer",
        "Incorrect use of printf with a pointer",
        "Uninitialized pointer",
        "Memory allocation required before dereferencing"
      ],
      "answer": 0,
      "selected": -1
    },
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
        title: const Text("pointer Quiz",
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
