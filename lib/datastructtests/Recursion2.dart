// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class Recursion2Page extends StatefulWidget {
  const Recursion2Page({super.key});

  @override
  _Recursion2PageState createState() => _Recursion2PageState();
}

class _Recursion2PageState extends State<Recursion2Page> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Identify the error in the following recursive function:\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "void printNumbers(int n) {\n"
          "    if (n <= 0) return;\n"
          "    cout << n << ' ';\n"
          "    printNumbers(n + 1);\n" // Error: Infinite recursion due to wrong condition
          "}\n\n"
          "int main() {\n"
          "    printNumbers(5);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The base case condition is incorrect (should be n > 0)",
        "The function returns wrong values",
        "There is no error",
        "The print statement is wrong"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the mistake in the following recursive function?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int factorial(int n) {\n"
          "    if (n == 0) return 1;\n"
          "    return n * factorial(n + 1); // Error: Recursion should decrease n\n"
          "}\n\n"
          "int main() {\n"
          "    cout << factorial(5) << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Incorrect recursion step",
        "Base case is incorrect",
        "The function is fine",
        "Wrong return type"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with this recursive function?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int sumNumbers(int n) {\n"
          "    if (n == 0) return 0;\n"
          "    return n + sumNumbers(n); // Error: Recursion should decrease n\n"
          "}\n\n"
          "int main() {\n"
          "    cout << sumNumbers(5) << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The recursive call does not reduce n",
        "The return type is incorrect",
        "The base case is wrong",
        "The sum logic is wrong"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in this recursive function?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "void printReverse(int n) {\n"
          "    if (n == 0) return;\n"
          "    cout << n << ' ';\n"
          "    printReverse(n); // Error: No change in n\n"
          "}\n\n"
          "int main() {\n"
          "    printReverse(5);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Recursion does not decrease the argument",
        "Base case is missing",
        "Print statement is incorrect",
        "The function will terminate correctly"
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
        title: const Text("Recursion 2 Quiz",
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
