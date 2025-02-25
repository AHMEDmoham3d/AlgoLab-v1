// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class VectorPage extends StatefulWidget {
  const VectorPage({super.key});

  @override
  _VectorPageState createState() => _VectorPageState();
}

class _VectorPageState extends State<VectorPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is wrong with the following vector declaration?\nvector<int>\n v(10);",
      "code": "vector<int> v(10);",
      "options": [
        "Should be: vector<int> v = {10};",
        "Should be: vector<int> v[10];",
        "Should be: vector<int> v;",
        "No error"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following vector operation?\nvector<int> v;\n v.add(5);",
      "code": "vector<int> v; v.add(5);",
      "options": [
        "Should be: v.push_back(5);",
        "Should be: v.insert(5);",
        "Should be: v.append(5);",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Identify the error in accessing the vector element.\nvector<int> v = {1, 2, 3};\n cout << v(1);",
      "code": "vector<int> v = {1, 2, 3}; cout << v(1);",
      "options": [
        "Should be: cout << v[1];",
        "Should be: cout << v.at(1);",
        "Should be: cout << v.get(1);",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Find the mistake in erasing the last element of the vector.\nvector<int> v = {1, 2, 3}; \nv.remove_last();",
      "code": "vector<int> v = {1, 2, 3}; v.remove_last();",
      "options": [
        "Should be: v.pop_back();",
        "Should be: v.erase_last();",
        "Should be: v.delete_last();",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is incorrect about this vector iteration?\nvector<int> v = {1, 2, 3}; \nfor(int i : v) cout << i;",
      "code": "vector<int> v = {1, 2, 3}; for(int i : v) cout << i;",
      "options": [
        "Should be: for(int &i : v) cout << i;",
        "Should be: for(auto i : v) cout << i;",
        "Should be: for(int i=0; i<v.size(); i++) cout << v[i];",
        "No error"
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
        title: const Center(
          child: Text("Vector Quiz",
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
