// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DoWhileLoopPage extends StatefulWidget {
  const DoWhileLoopPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoWhileLoopPageState createState() => _DoWhileLoopPageState();
}

class _DoWhileLoopPageState extends State<DoWhileLoopPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What does a do-while loop guarantee?",
      "options": [
        "The loop runs at least once",
        "The loop may never run",
        "It is the same as a while loop",
        "It is a conditional statement"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which keyword is used to exit a do-while loop prematurely?",
      "options": ["return", "continue", "break", "exit"],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the correct syntax for a do-while loop in JavaScript?",
      "options": [
        "do { } while(condition);",
        "while(condition) { } do;",
        "loop { } while(condition);",
        "do-while(condition) { }"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What happens if the condition in a do-while loop is false on the first check?",
      "options": [
        "The loop runs once and then stops",
        "The loop never runs",
        "An error occurs",
        "It runs indefinitely"
      ],
      "answer": 0,
      "selected": -1
    },
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
          "do while Quiz",
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
