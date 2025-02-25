// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ForEachPage extends StatefulWidget {
  const ForEachPage({super.key});

  @override
  _ForEachPageState createState() => _ForEachPageState();
}

class _ForEachPageState extends State<ForEachPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the output of the following C++ code using for_each?\n\n"
              "```cpp\n"
              "#include <iostream>\n"
              "#include <vector>\n"
              "#include <algorithm>\n"
              "using namespace std;\n\n"
              "void print(int x) { cout << x * 2 << ' '; }\n\n"
              "int main() {\n"
              "    vector<int> v = {1, 2, 3, 4};\n"
              "    for_each(v.begin(), v.end(), print);\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": [
        "1 2 3 4",
        "2 4 6 8",
        "Error: for_each requires a lambda function",
        "No output, for_each does not modify elements"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the correct way to use a lambda function in for_each?",
      "options": [
        "for_each(v.begin(), v.end(), [](int x) { cout << x << ' '; });",
        "for_each(v.begin(), v.end(), x -> cout << x << ' ');",
        "for_each(v.begin(), v.end(), [x] { cout << x << ' '; });",
        "for_each(v.begin(), v.end(), {cout << x << ' ';});"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which header file must be included to use for_each in C++?",
      "options": [
        "#include <iostream>",
        "#include <vector>",
        "#include <algorithm>",
        "#include <iterator>"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <vector>\n"
          "using namespace std;\n\n"
          "void print(int x) { cout << x << endl; }\n\n"
          "int main() {\n"
          "    vector<int> v = {1, 2, 3, 4, 5};\n"
          "    for_each(v.begin(), v.end(), print);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Missing #include <algorithm>",
        "for_each cannot be used with vectors",
        "print function must return an integer",
        "for_each must be called inside a loop"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <vector>\n"
          "#include <algorithm>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    vector<int> v = {1, 2, 3, 4, 5};\n"
          "    for_each(v.begin(), v.end(), [](int x) { cout << x << endl; });\n"
          "}\n"
          "```",
      "options": [
        "Missing return statement in main function",
        "Lambda function syntax is incorrect",
        "for_each does not work with lambda functions",
        "for_each cannot be used with iterators"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <vector>\n"
          "#include <algorithm>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    vector<int> v = {1, 2, 3, 4, 5};\n"
          "    for_each(v.begin(), v.end(), [](int x) { x *= 2; });\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "for_each cannot modify elements in a lambda function",
        "Missing return statement in lambda function",
        "Lambda function must be declared before for_each",
        "Algorithm library is not needed"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <vector>\n"
          "#include <algorithm>\n"
          "using namespace std;\n\n"
          "void print(int& x) { x *= 2; }\n\n"
          "int main() {\n"
          "    vector<int> v = {1, 2, 3, 4, 5};\n"
          "    for_each(v.begin(), v.end(), print);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "for_each cannot modify elements this way",
        "Function arguments cannot be passed by reference",
        "Algorithm library is missing",
        "for_each does not support user-defined functions"
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
        title: const Text("ForEach Quiz",
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
