import 'package:flutter/material.dart';

class ForCPlsPage extends StatefulWidget {
  const ForCPlsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForCPlsPageState createState() => _ForCPlsPageState();
}

class _ForCPlsPageState extends State<ForCPlsPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the correct syntax for a for loop in C++?",
      "code": "?",
      "options": [
        "for (int i = 0; i < 10; i++)",
        "loop (int i = 0; i < 10; i++)",
        "while (i < 10; i++)",
        "repeat (int i = 0; i < 10; i++)"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "for (int i = 0; i < 5; i++) { cout << i << ' '; }",
      "code": "for (int i = 0; i < 5; i++) { cout << i << ' '; }",
      "options": ["0 1 2 3 4", "1 2 3 4 5", "0 2 4 6 8", "Infinite loop"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Which part of the for loop is executed only once?\nfor (int i = 0; i < 10; i++) { ... }",
      "code": "for (int i = 0; i < 10; i++) { ... }",
      "options": ["Initialization", "Condition", "Increment", "Loop body"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which of the following is an infinite for loop?",
      "code": "?",
      "options": [
        "for (;;) { }",
        "for (int i = 0; i < 10; i--) { }",
        "for (int i = 0; i < 10; i++) { }",
        "None of the above"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the purpose of the third section in a for loop?\nfor (int i = 0; i < 10; i++) { ... }",
      "code": "for (int i = 0; i < 10; i++) { ... }",
      "options": [
        "To initialize variables",
        "To update the loop variable",
        "To check the loop condition",
        "To define the loop body"
      ],
      "answer": 1,
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
        title: const Center(
          child: Text("for loop Quiz",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
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
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      ),
                      child: const Text("Next",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
