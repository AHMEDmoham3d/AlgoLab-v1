// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HashingPage extends StatefulWidget {
  const HashingPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HashingPageState createState() => _HashingPageState();
}

class _HashingPageState extends State<HashingPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in this hash function?\n\n"
          "```c\n"
          "int hash(int key) {\n"
          "  return key % 10;\n"
          "  key = key / 10;\n"
          "}\n"
          "```",
      "options": [
        "Unreachable code",
        "Incorrect hash calculation",
        "Division by zero risk",
        "Return type should be void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Identify the mistake in this hash table insertion function:\n\n"
              "```c\n"
              "void insert(int hashTable[], int key) {\n"
              "  int index = key % 10;\n"
              "  while (hashTable[index] != -1) {\n"
              "    index++;\n"
              "  }\n"
              "  hashTable[index] = key;\n"
              "}\n"
              "```",
      "options": [
        "No handling for array overflow",
        "Index calculation is incorrect",
        "hashTable should be a pointer",
        "Loop condition should be different"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the bug in the following hashing function:\n\n"
          "```c\n"
          "int hash(int key) {\n"
          "  return abs(key) % 10;\n"
          "}\n"
          "```",
      "options": [
        "abs() may cause overflow",
        "Incorrect modulus operation",
        "Return type should be void",
        "Incorrect key modification"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in this hash function implementation?\n\n"
          "```c\n"
          "int hash(char* key) {\n"
          "  int sum = 0;\n"
          "  for (int i = 0; key[i] != '\\0'; i++) {\n"
          "    sum += key[i];\n"
          "  }\n"
          "  return sum % 10;\n"
          "}\n"
          "```",
      "options": [
        "Sum may exceed int range",
        "Key should be an integer",
        "Loop condition is incorrect",
        "Function should return void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the logical mistake in this function:\n\n"
          "```c\n"
          "void insert(int hashTable[], int key) {\n"
          "  int index = key % 10;\n"
          "  if (hashTable[index] != -1) {\n"
          "    index = (index + 1) % 10;\n"
          "  }\n"
          "  hashTable[index] = key;\n"
          "}\n"
          "```",
      "options": [
        "Does not handle collisions properly",
        "Loop should be used for collision resolution",
        "Modulo operation is incorrect",
        "Key is not stored properly"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What mistake exists in this function?\n\n"
          "```c\n"
          "void insert(int hashTable[], int key) {\n"
          "  int index = key % 10;\n"
          "  while (hashTable[index] != -1) {\n"
          "    index = (index + 1);\n"
          "  }\n"
          "  hashTable[index] = key;\n"
          "}\n"
          "```",
      "options": [
        "Index should wrap around using modulo",
        "Loop should be removed",
        "Key is not stored",
        "Memory allocation is missing"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the bug in this hash table lookup function:\n\n"
          "```c\n"
          "int search(int hashTable[], int key) {\n"
          "  int index = key % 10;\n"
          "  while (hashTable[index] != key) {\n"
          "    index = (index + 1) % 10;\n"
          "  }\n"
          "  return index;\n"
          "}\n"
          "```",
      "options": [
        "No condition to stop if key is missing",
        "Index calculation is incorrect",
        "Loop should be reversed",
        "Return type should be void"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following hash table delete function?\n\n"
              "```c\n"
              "void delete(int hashTable[], int key) {\n"
              "  int index = key % 10;\n"
              "  while (hashTable[index] != key) {\n"
              "    index = (index + 1) % 10;\n"
              "  }\n"
              "  hashTable[index] = -1;\n"
              "}\n"
              "```",
      "options": [
        "No handling if key is not found",
        "Incorrect deletion logic",
        "Key should not be assigned -1",
        "Loop should stop earlier"
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
        title: const Text("Hashing Quiz",
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
