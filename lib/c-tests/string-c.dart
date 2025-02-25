// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StringCPage extends StatefulWidget {
  const StringCPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StringCPageState createState() => _StringCPageState();
}

class _StringCPageState extends State<StringCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What will be the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char str[] = \"Hello\";\n"
          "    printf(\"%s\", str);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["Hello", "H", "Segmentation fault", "Compilation error"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What does the following C code output?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char str[] = {'H', 'e', 'l', 'l', 'o', '\\0'};\n"
          "    printf(\"%s\", str);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["Hello", "H", "Segmentation fault", "Garbage value"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the length of the string in the following C code?\n\n"
              "```c\n"
              "#include <stdio.h>\n"
              "int main() {\n"
              "    char str[] = \"Hello\\0World\";\n"
              "    printf(\"%lu\", sizeof(str)/sizeof(str[0]));\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": ["12", "6", "11", "10"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What will be the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    char *str = \"Hello\";\n"
          "    str[0] = 'h';\n"
          "    printf(\"%s\", str);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "hello",
        "Compilation error",
        "Segmentation fault",
        "Garbage value"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Which function is used to concatenate two strings in C?",
      "options": ["strcat()", "strcpy()", "strcmp()", "strlen()"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Which of the following is the correct way to declare a string in C?",
      "options": [
        "char str[] = \"Hello\";",
        "char str = \"Hello\";",
        "char str[5] = \"Hello\";",
        "char *str; str = \"Hello\";"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "#include <string.h>\n"
          "int main() {\n"
          "    char str1[] = \"Hello\";\n"
          "    char str2[] = \"World\";\n"
          "    strcat(str1, str2);\n"
          "    printf(\"%s\", str1);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "HelloWorld",
        "Hello World",
        "Compilation error",
        "Segmentation fault"
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
        title: const Text("String Quiz",
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
