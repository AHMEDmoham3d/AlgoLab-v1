// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class BitwiseOperatXorNotPage extends StatefulWidget {
  const BitwiseOperatXorNotPage({super.key});

  @override
  _BitwiseOperatXorNotPageState createState() =>
      _BitwiseOperatXorNotPageState();
}

class _BitwiseOperatXorNotPageState extends State<BitwiseOperatXorNotPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 5, b = 3;\n"
          "    cout << a ^ b << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "No error, the code is correct",
        "XOR operator is not supported in C++",
        "XOR operator should be used with a variable",
        "The result of XOR cannot be printed directly"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 5;\n"
          "    cout << ~a << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The NOT operator (~) cannot be used with integers",
        "No error, the code is correct",
        "The NOT operator is invalid for integers in C++",
        "The output will be incorrect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 7;\n"
          "    int b = 3;\n"
          "    cout << a ^ b ^ 4 << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "XOR operation is not allowed on integers",
        "The XOR operator should only be used between two variables",
        "No error, the code is correct",
        "XOR operation is not commutative"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 9;\n"
          "    int b = 6;\n"
          "    cout << ~(a & b) << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The NOT operator (~) cannot be used with logical operations",
        "No error, the code is correct",
        "The AND operator (&) should be replaced with OR (|)",
        "Incorrect output due to using both AND and NOT operators"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 10;\n"
          "    int b = 5;\n"
          "    cout << a ^ ~b << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "No error, the code is correct",
        "XOR and NOT cannot be used together",
        "You cannot mix XOR and NOT operations on different variables",
        "The NOT operator (~) is applied incorrectly"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 6;\n"
          "    cout << a << ~a << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "The output will be incorrect due to precedence of operators",
        "No error, the code is correct",
        "The NOT operator (~) cannot be applied to the variable directly",
        "The NOT operator (~) should be used before the variable"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 4;\n"
          "    int b = 2;\n"
          "    cout << a ^ b ^ 4 << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "No error, the code is correct",
        "The result of XOR should be assigned to a variable",
        "XOR cannot be used with integers in C++",
        "XOR operation does not work with multiple operands"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int a = 8;\n"
          "    cout << ~a << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "No error, the code is correct",
        "Output will be incorrect because of negative result",
        "The NOT operator (~) works only with unsigned integers",
        "The result of NOT operation will be a float"
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
        title: const Text("Bitwise XOR & NOT Quiz",
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
