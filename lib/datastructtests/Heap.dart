// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class HeapPage extends StatefulWidget {
  const HeapPage({super.key});

  @override
  _HeapPageState createState() => _HeapPageState();
}

class _HeapPageState extends State<HeapPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "Identify the bug in the function for allocating memory on the heap:\n\n"
              "```cpp\n"
              "void allocateMemory() {\n"
              "  int* ptr;\n"
              "  *ptr = 10; // Error\n"
              "}\n"
              "```",
      "options": [
        "Pointer is uninitialized",
        "Memory leak occurs",
        "Incorrect pointer arithmetic",
        "Heap corruption"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is wrong with the following heap memory allocation?\n\n"
          "```cpp\n"
          "void allocateArray() {\n"
          "  int* arr = new int[5];\n"
          "  delete arr; // Error\n"
          "}\n"
          "```",
      "options": [
        "Memory leak occurs",
        "Incorrect delete operation",
        "Array size is incorrect",
        "Dereferencing issue"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Find the logical error in this heap memory deallocation:\n\n"
          "```cpp\n"
          "void deallocate(int* ptr) {\n"
          "  delete ptr;\n"
          "  delete ptr; // Error\n"
          "}\n"
          "```",
      "options": [
        "Double delete causes undefined behavior",
        "Memory is not freed properly",
        "Pointer arithmetic error",
        "Heap fragmentation occurs"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Identify the issue in the following code snippet:\n\n"
          "```cpp\n"
          "void accessInvalidMemory() {\n"
          "  int* ptr = new int(10);\n"
          "  delete ptr;\n"
          "  cout << *ptr; // Error\n"
          "}\n"
          "```",
      "options": [
        "Memory leak occurs",
        "Accessing a dangling pointer",
        "Incorrect pointer arithmetic",
        "Heap overflow"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the mistake in this dynamic memory allocation?\n\n"
          "```cpp\n"
          "void allocate() {\n"
          "  int* ptr = new int;\n"
          "  ptr = new int; // Error\n"
          "}\n"
          "```",
      "options": [
        "Memory leak occurs",
        "Pointer is uninitialized",
        "Incorrect pointer arithmetic",
        "Accessing unallocated memory"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the issue in this function for using heap memory:\n\n"
          "```cpp\n"
          "void incorrectDelete() {\n"
          "  char* ptr = new char;\n"
          "  delete[] ptr; // Error\n"
          "}\n"
          "```",
      "options": [
        "Incorrect delete operation",
        "Memory leak occurs",
        "Pointer arithmetic issue",
        "Stack overflow"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the logical flaw in this heap allocation function?\n\n"
              "```cpp\n"
              "void allocateStruct() {\n"
              "  struct Data {\n"
              "    int x;\n"
              "  };\n"
              "  Data* d = new Data;\n"
              "  delete d;\n"
              "  delete d; // Error\n"
              "}\n"
              "```",
      "options": [
        "Memory leak occurs",
        "Double delete causes undefined behavior",
        "Incorrect memory allocation",
        "Pointer remains uninitialized"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "Identify the issue in the following heap allocation scenario:\n\n"
              "```cpp\n"
              "void allocateAndForget() {\n"
              "  int* ptr = new int(5);\n"
              "  ptr = nullptr; // Error\n"
              "}\n"
              "```",
      "options": [
        "Memory leak occurs",
        "Pointer is uninitialized",
        "Incorrect pointer assignment",
        "Heap corruption"
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
        title: const Text("Heap Quiz",
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
