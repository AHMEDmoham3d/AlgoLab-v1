import 'package:flutter/material.dart';

class ForLoopPage extends StatefulWidget {
  const ForLoopPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForLoopPageState createState() => _ForLoopPageState();
}

class _ForLoopPageState extends State<ForLoopPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in this JavaScript code?\n\nfor i = 0; i < 5; i++) { console.log(i); }",
      "options": [
        "Missing 'var', 'let', or 'const' before i",
        "Semicolon missing",
        "Infinite loop",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the error in this JavaScript code?\n\nfor (let i = 0, i < 5; i++) { console.log(i); }",
      "options": [
        "Comma should be a semicolon",
        "i should be declared with 'var'",
        "Loop condition is incorrect",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the error in this JavaScript code?\n\nfor (let i = 0; i < 5; i--) { console.log(i); }",
      "options": [
        "Loop condition should use 'i++' instead of 'i--'",
        "Missing brackets",
        "Cannot use 'let' inside loops",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the error in this JavaScript code?\n\nfor (let i = 0; i < 5) { console.log(i); i++; }",
      "options": [
        "Missing increment step in the loop definition",
        "Incorrect condition",
        "Loop should not use 'console.log' inside",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the error in this JavaScript code?\n\nfor (let i = 0; i < 5; i++); { console.log(i); }",
      "options": [
        "Extra semicolon after the for loop",
        "Missing condition",
        "i is not defined inside the loop",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the output of this JavaScript code?\n\nfor (let i = 0; i < 3; i++) { setTimeout(() => console.log(i), 1000); }",
      "options": ["0 1 2", "3 3 3", "undefined", "Error"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in this JavaScript code?\n\nfor (var i = 0; i < 3; i++) { setTimeout(() => console.log(i), 1000); }",
      "options": [
        "Prints 0 1 2",
        "Prints 3 3 3",
        "Throws an error",
        "Infinite loop"
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
        title: const Text(
          "for loop Quiz",
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
