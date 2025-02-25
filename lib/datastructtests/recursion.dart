// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RecursionPage extends StatefulWidget {
  const RecursionPage({super.key});

  @override
  _RecursionPageState createState() => _RecursionPageState();
}

class _RecursionPageState extends State<RecursionPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the output of the following recursive function?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "void recursive(int n) {\n"
          "    if (n == 0) return;\n"
          "    cout << n << ' ';\n"
          "    recursive(n - 1);\n"
          "}\n\n"
          "int main() {\n"
          "    recursive(5);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "5 4 3 2 1",
        "1 2 3 4 5",
        "0 1 2 3 4",
        "Error due to infinite recursion"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the base case in the following recursive function?\n\n"
              "```cpp\n"
              "#include <iostream>\n"
              "using namespace std;\n\n"
              "int factorial(int n) {\n"
              "    if (n == 0) return 1;\n"
              "    return n * factorial(n - 1);\n"
              "}\n\n"
              "int main() {\n"
              "    cout << factorial(5) << endl;\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": ["n == 1", "n == 0", "n == 5", "No base case"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the output of the following recursive function?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int power(int x, int y) {\n"
          "    if (y == 0) return 1;\n"
          "    return x * power(x, y - 1);\n"
          "}\n\n"
          "int main() {\n"
          "    cout << power(2, 3) << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["6", "8", "4", "Error due to infinite recursion"],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What will happen if the recursive function does not have a valid base case?\n\n"
              "```cpp\n"
              "#include <iostream>\n"
              "using namespace std;\n\n"
              "void infiniteRecursion(int n) {\n"
              "    cout << n << ' ';\n"
              "    infiniteRecursion(n + 1);\n"
              "}\n\n"
              "int main() {\n"
              "    infiniteRecursion(1);\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": [
        "Stack Overflow",
        "The program will terminate normally",
        "Recursion will stop at n == 0",
        "The program will print 1"
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
        title: const Text("Recursion Quiz",
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
