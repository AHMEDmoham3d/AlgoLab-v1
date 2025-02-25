// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BitwiseoperatorLeftShiftPage extends StatefulWidget {
  const BitwiseoperatorLeftShiftPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BitwiseoperatorLeftShiftPageState createState() =>
      _BitwiseoperatorLeftShiftPageState();
}

class _BitwiseoperatorLeftShiftPageState
    extends State<BitwiseoperatorLeftShiftPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the result of the following C++ code using the Left Shift operator?\n\n"
              "```cpp\n"
              "#include <iostream>\n"
              "using namespace std;\n\n"
              "int main() {\n"
              "    int x = 5;\n"
              "    cout << (x << 1) << endl;\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": ["10", "15", "5", "2"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What will the following code output?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int x = 3;\n"
          "    cout << (x << 2) << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["12", "6", "3", "9"],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the result of the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    int x = 10;\n"
          "    cout << (x << 3) << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["80", "20", "5", "40"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the effect of the left shift operator on the number 1 in the following code?\n\n"
              "```cpp\n"
              "#include <iostream>\n"
              "using namespace std;\n\n"
              "int main() {\n"
              "    int x = 1;\n"
              "    cout << (x << 5) << endl;\n"
              "    return 0;\n"
              "}\n"
              "```",
      "options": ["32", "2", "16", "5"],
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
        title: const Text("Bitwise operator left Shift Quiz",
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
