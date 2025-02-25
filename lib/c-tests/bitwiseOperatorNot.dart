// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class BitwiseOperatorNotPage extends StatefulWidget {
  const BitwiseOperatorNotPage({super.key});

  @override
  _BitwiseOperatorNotPageState createState() => _BitwiseOperatorNotPageState();
}

class _BitwiseOperatorNotPageState extends State<BitwiseOperatorNotPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in the following code? \nint x = 5; \nint result = ~x + 3;",
      "options": [
        "Missing parentheses around the bitwise NOT operator",
        "The addition should be done before the bitwise NOT",
        "The bitwise NOT operator is incorrectly applied",
        "There is no error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = 8; \nint result = ~x * 2;",
      "options": [
        "The multiplication should be done before the bitwise NOT",
        "The result is incorrect for this operation",
        "The bitwise NOT operator is not suitable for multiplication",
        "There is no error"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = 0; \nint result = ~x - 1;",
      "options": [
        "Bitwise NOT should not be used with subtraction",
        "The operator precedence is wrong",
        "The result of ~x should be incremented, not decremented",
        "There is no error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = 10; \nint result = ~x << 2;",
      "options": [
        "The shift operation should happen before the bitwise NOT",
        "The shift operator should be applied after the addition",
        "The operator precedence might not give the expected result",
        "There is no error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = 7; \nint result = ~x >> 1;",
      "options": [
        "Right shift should be done before the bitwise NOT",
        "Bitwise NOT and shift operations might not work well together",
        "The operator precedence is not properly handled",
        "There is no error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = -3; \nint result = ~x;",
      "options": [
        "The result should be negated before applying bitwise NOT",
        "The bitwise NOT operator doesn’t work on negative numbers",
        "Bitwise NOT does not affect negative values",
        "There is no error"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = 12; \nint result = ~x + 2 * 3;",
      "options": [
        "The multiplication should be applied after the bitwise NOT",
        "Bitwise NOT should be applied after the multiplication",
        "The operator precedence might cause the wrong result",
        "There is no error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code? \nint x = 14; \nint result = ~x / 2;",
      "options": [
        "Division should be done before applying the bitwise NOT",
        "Bitwise NOT and division should not be combined",
        "The division operator is not compatible with bitwise NOT",
        "There is no error"
      ],
      "answer": 3,
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
        title: const Text("Bitwise NOT Quiz",
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
