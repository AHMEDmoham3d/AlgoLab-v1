// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class DoWhileCPage extends StatefulWidget {
  const DoWhileCPage({super.key});

  @override
  _DoWhileCPageState createState() => _DoWhileCPageState();
}

class _DoWhileCPageState extends State<DoWhileCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What will be the output of the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int i = 5;\n"
          "    do {\n"
          "        printf(\"%d \", i);\n"
          "        i--;\n"
          "    } while (i > 0);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["5 4 3 2 1", "5 4 3 2 1 0", "4 3 2 1 0", "Infinite loop"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "How many times will the following C loop execute?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int i = 10;\n"
          "    do {\n"
          "        printf(\"Hello\");\n"
          "    } while (i < 0);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["0 times", "1 time", "Infinite times", "Compiler error"],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the main difference between a 'do-while' and a 'while' loop in C?",
      "options": [
        "do-while executes at least once, while while may not execute at all",
        "while executes at least once, do-while may not execute",
        "Both work the same way",
        "do-while does not check conditions"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which of the following is true about 'do-while' loops in C?",
      "options": [
        "Condition is checked before execution",
        "Loop will always run at least once",
        "It runs only if the condition is true",
        "do-while cannot be used with integers"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What will be the output of this C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "int main() {\n"
          "    int i = 3;\n"
          "    do {\n"
          "        printf(\"%d \", i);\n"
          "    } while (--i);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["3 2 1 0", "3 2 1", "2 1 0", "Infinite loop"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Which statement is true about 'do-while' loops in C?",
      "options": [
        "It always runs at least once",
        "It never runs if the condition is false initially",
        "It runs only if the condition is true",
        "It is not used in C"
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
        title: const Text("Do-While Quiz",
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
