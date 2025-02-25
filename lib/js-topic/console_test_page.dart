// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ConsoleTestPage extends StatefulWidget {
  // ignore: use_super_parameters
  const ConsoleTestPage({Key? key}) : super(key: key);

  @override
  _ConsoleTestPageState createState() => _ConsoleTestPageState();
}

class _ConsoleTestPageState extends State<ConsoleTestPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the correct way to declare a variable in JavaScript?",
      "options": ["var x;", "let x;", "const x;", "All of the above"],
      "answer": 3,
      "selected": -1
    },
    {
      "question":
          "What is the correct syntax for printing to the console in JavaScript?",
      "options": [
        "console.log('message')",
        "log.console('message')",
        "print.console('message')",
        "None of the above"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What does console.warn() do?",
      "options": [
        "Logs a warning message",
        "Logs an error message",
        "Logs a regular message",
        "Does nothing"
      ],
      "answer": 0,
      "selected": -1
    },
  ];

  int currentQuestionIndex = 0;

  void selectAnswer(int optionIndex) {
    setState(() {
      questions[currentQuestionIndex]["selected"] = optionIndex;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "JavaScript Quiz",
            style: TextStyle(
              color: Colors.white, // White text color
              fontWeight: FontWeight.bold, // Optional: to make it bold
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back icon
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Text(
                  "Q${currentQuestionIndex + 1}: ${questions[currentQuestionIndex]["question"]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
                          color: isSelected ? Colors.blue : Colors.grey[300],
                        ),
                        child: Text(
                          questions[currentQuestionIndex]["options"]
                              [optionIndex],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      questions[currentQuestionIndex]["selected"] != -1
                          ? Colors.blue
                          : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: questions[currentQuestionIndex]["selected"] != -1
                    ? nextQuestion
                    : null,
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next',
                  style: TextStyle(
                      fontSize: 18,
                      color: questions[currentQuestionIndex]["selected"] != -1
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
