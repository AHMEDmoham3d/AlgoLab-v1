// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MallocPage extends StatefulWidget {
  const MallocPage({super.key});

  @override
  _MallocPageState createState() => _MallocPageState();
}

class _MallocPageState extends State<MallocPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr;\n"
          "    ptr = malloc(sizeof(int) * 5);\n"
          "    for (int i = 0; i < 5; i++) {\n"
          "        ptr[i] = i * 2;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory is allocated but never freed",
        "malloc does not allocate memory correctly",
        "Loop index is out of bounds",
        "Dereferencing NULL pointer"
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
          "    char *str;\n"
          "    str = (char*)malloc(10);\n"
          "    sprintf(str, \"Hello, World!\");\n"
          "    printf(\"%s\\n\", str);\n"
          "    free(str);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory allocation is incorrect",
        "Buffer overflow due to insufficient memory allocation",
        "free() should not be used for strings",
        "Pointer is used after being freed"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *arr = malloc(5 * sizeof(int));\n"
          "    for (int i = 0; i <= 5; i++) {\n"
          "        arr[i] = i;\n"
          "    }\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak due to missing free()",
        "Loop accesses out-of-bounds memory",
        "malloc should be casted",
        "free() should be called before the loop"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr;\n"
          "    free(ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "free() is called on an uninitialized pointer",
        "Pointer should be allocated before freeing",
        "free() should be used only for arrays",
        "Memory is allocated but never used"
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
          "    int *ptr = malloc(0);\n"
          "    printf(\"%p\\n\", ptr);\n"
          "    free(ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "malloc(0) may return NULL or valid pointer",
        "Memory allocation failure",
        "free() should not be used on ptr",
        "Pointer is used after being freed"
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
          "    int *ptr = malloc(10 * sizeof(int));\n"
          "    free(ptr);\n"
          "    ptr[0] = 10;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory is allocated incorrectly",
        "Use of freed memory (dangling pointer)",
        "Memory leak",
        "Pointer arithmetic is incorrect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <stdlib.h>\n\n"
          "int main() {\n"
          "    int *ptr = (int*)malloc(5);\n"
          "    free(ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "malloc should allocate size based on sizeof(int)",
        "Pointer arithmetic is incorrect",
        "Memory leak",
        "Use of uninitialized pointer"
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
          "    int *arr = malloc(10 * sizeof(int));\n"
          "    arr = malloc(20 * sizeof(int));\n"
          "    free(arr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Memory leak due to lost pointer",
        "Double allocation issue",
        "Incorrect use of sizeof()",
        "free() should be called twice"
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
          "    void *ptr = malloc(100);\n"
          "    free(ptr);\n"
          "    free(ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Double free leads to undefined behavior",
        "Memory leak",
        "Void pointers cannot be freed",
        "free() should be used inside loops"
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
          "    int *ptr = malloc(5 * sizeof(int));\n"
          "    ptr++;\n"
          "    free(ptr);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Pointer arithmetic before freeing memory leads to undefined behavior",
        "Memory leak",
        "sizeof(int) should be used differently",
        "Pointer should be decremented before freeing"
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
        title: const Text("Malloc Quiz",
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
