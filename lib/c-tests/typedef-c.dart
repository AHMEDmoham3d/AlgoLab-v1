// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TypedefPage extends StatefulWidget {
  const TypedefPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TypedefPageState createState() => _TypedefPageState();
}

class _TypedefPageState extends State<TypedefPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef int Integer;\n"
          "Integer x = 10;\n"
          "printf('%d', y);\n"
          "```",
      "options": [
        "Variable 'y' is not declared",
        "Incorrect use of printf format",
        "Typedef 'Integer' is not defined correctly",
        "The variable x should be a pointer"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef float f;\n"
          "f a = '3.5';\n"
          "printf('%f', a);\n"
          "```",
      "options": [
        "Incorrect type assignment for f",
        "Missing semicolon after the printf statement",
        "Typedef 'f' is incorrectly defined",
        "Incorrect use of printf format"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef char* String;\n"
          "String str = 'Hello';\n"
          "printf('%s', str);\n"
          "```",
      "options": [
        "Incorrect use of single quotes for string",
        "Typedef 'String' is not correct",
        "The printf format is incorrect",
        "Nothing is wrong with the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef unsigned int Uint;\n"
          "Uint num = -10;\n"
          "printf('%u', num);\n"
          "```",
      "options": [
        "Unsigned int cannot store negative values",
        "Typedef 'Uint' is not valid",
        "Incorrect printf format for unsigned integer",
        "Nothing is wrong with the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef int Array[10];\n"
          "Array arr = {1, 2, 3};\n"
          "printf('%d', arr[2]);\n"
          "```",
      "options": [
        "Array 'arr' is not initialized properly",
        "The typedef for 'Array' is incorrect",
        "Typedef 'Array' cannot be used like this",
        "Nothing is wrong with the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef struct { int a; float b; } Point;\n"
          "Point p = {1, 'c'};\n"
          "printf('%d %f', p.a, p.b);\n"
          "```",
      "options": [
        "Invalid initialization for struct members",
        "Incorrect printf format for struct members",
        "Typedef for 'Point' is incorrect",
        "Nothing is wrong with the code"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef double MyDouble;\n"
          "MyDouble x = 100;\n"
          "printf('%f', x);\n"
          "```",
      "options": [
        "Incorrect initialization of typedef 'MyDouble'",
        "Typedef 'MyDouble' is incorrectly defined",
        "printf format should be '%lf' instead of '%f'",
        "Nothing is wrong with the code"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "typedef unsigned char Byte;\n"
          "Byte a = 300;\n"
          "printf('%u', a);\n"
          "```",
      "options": [
        "Unsigned char cannot hold values greater than 255",
        "Typedef 'Byte' should be a different type",
        "The printf format is incorrect",
        "Nothing is wrong with the code"
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
        title: const Text("typedef Quiz",
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
