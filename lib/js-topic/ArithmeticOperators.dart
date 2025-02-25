// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ArithmeticOperatorsPage extends StatefulWidget {
  const ArithmeticOperatorsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArithmeticOperatorsPageState createState() =>
      _ArithmeticOperatorsPageState();
}

class _ArithmeticOperatorsPageState extends State<ArithmeticOperatorsPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the result of: 5 + 3 * 2 in JavaScript?",
      "options": ["16", "11", "10", "13"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What does the '%' operator do in JavaScript?",
      "options": [
        "Exponentiation",
        "Modulo",
        "Bitwise AND",
        "None of the above"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the result of: 10 / 2?",
      "options": ["4", "5", "10", "2"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What happens when you divide by zero in JavaScript?",
      "options": ["Error", "Infinity", "0", "NaN"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the result of: 7 - 2 * 3?",
      "options": ["15", "1", "5", "10"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "Which operator is used for exponentiation in JavaScript?",
      "options": ["^", "**", "exp()", "^^"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the result of: 3 + 6 / 3?",
      "options": ["5", "3", "7", "6"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the correct order of operations in JavaScript?",
      "options": [
        "Addition first, then multiplication",
        "Multiplication first, then addition",
        "Left to right always",
        "None of the above"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the result of: 8 % 3?",
      "options": ["2", "3", "1", "0"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What will be the result of: 10 + '5' in JavaScript?",
      "options": ["15", "105", "Error", "NaN"],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the result of: 2 ** 3?",
      "options": ["6", "9", "8", "12"],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What happens when you use '++' operator on a number?",
      "options": [
        "It increments the number by 2",
        "It increments the number by 1",
        "It decrements the number",
        "No effect"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the value of: (5 + 2) * 3?",
      "options": ["21", "17", "15", "12"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which operator is used for floor division in JavaScript?",
      "options": ["/", "//", "Math.floor()", "%"],
      "answer": 2,
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
        title: const Text(
          "Arithmetic Operators Quiz",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // لضبط النص في المنتصف
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: goBack,
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: testCompleted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Quiz Completed!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your Score: $score / ${questions.length}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: allCorrect ? goBack : resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: allCorrect ? Colors.green : Colors.red,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                                color: isSelected ? Colors.blue : Colors.white,
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
