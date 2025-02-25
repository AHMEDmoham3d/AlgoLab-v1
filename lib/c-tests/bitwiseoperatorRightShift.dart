// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class BitwiseoperatorRightShiftPage extends StatefulWidget {
  const BitwiseoperatorRightShiftPage({super.key});

  @override
  _BitwiseoperatorRightShiftPageState createState() =>
      _BitwiseoperatorRightShiftPageState();
}

class _BitwiseoperatorRightShiftPageState
    extends State<BitwiseoperatorRightShiftPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the result of the following right shift operation?\n\n"
              "```cpp\n"
              "int x = 8; \n"
              "x = x >> 2;\n"
              "cout << x << endl;\n"
              "```",
      "options": ["1", "2", "4", "16"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What will the following code output?\n\n"
          "```cpp\n"
          "int y = 16; \n"
          "y = y >> 3;\n"
          "cout << y << endl;\n"
          "```",
      "options": ["1", "2", "4", "8"],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the result of the following right shift operation?\n\n"
              "```cpp\n"
              "int z = 32; \n"
              "z = z >> 4;\n"
              "cout << z << endl;\n"
              "```",
      "options": ["1", "2", "4", "16"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the value of 'x' after this operation?\n\n"
          "```cpp\n"
          "int x = 64; \n"
          "x = x >> 2;\n"
          "cout << x << endl;\n"
          "```",
      "options": ["16", "32", "64", "128"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What happens when you right shift a negative number?\n\n"
          "```cpp\n"
          "int a = -8; \n"
          "a = a >> 2;\n"
          "cout << a << endl;\n"
          "```",
      "options": [
        "The result is always negative",
        "The result is always positive",
        "The result depends on the system",
        "The result is zero"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the result of the following right shift operation?\n\n"
              "```cpp\n"
              "int b = 1; \n"
              "b = b >> 1;\n"
              "cout << b << endl;\n"
              "```",
      "options": ["0", "1", "2", "4"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "How do you shift a number by 1 position to the right in C++?\n\n"
              "```cpp\n"
              "int c = 16;\n"
              "c = c >> 1;\n"
              "cout << c << endl;\n"
              "```",
      "options": [
        "Dividing by 2",
        "Multiplying by 2",
        "Subtracting 1",
        "Adding 1"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Which of the following is true for the right shift operator in C++?\n\n"
              "```cpp\n"
              "int x = 4;\n"
              "x = x >> 1;\n"
              "cout << x << endl;\n"
              "```",
      "options": [
        "It divides the number by 2",
        "It multiplies the number by 2",
        "It subtracts 1 from the number",
        "It adds 1 to the number"
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
        title: const Text("Bitwise Right Shift Quiz",
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
