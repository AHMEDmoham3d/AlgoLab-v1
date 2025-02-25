// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class ConstructorPage extends StatefulWidget {
  const ConstructorPage({super.key});

  @override
  _ConstructorPageState createState() => _ConstructorPageState();
}

class _ConstructorPageState extends State<ConstructorPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following constructor code?\n\n"
          "class Example {\n"
          "    Example(); // Constructor declaration\n"
          "};\n"
          "int main() {\n"
          "    Example obj;\n"
          "    return 0;\n"
          "}",
      "options": [
        "The constructor is not defined outside the class",
        "The constructor must have a return type",
        "Objects cannot be created inside main()",
        "There is no error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Find the mistake in the constructor below:\n\n"
          "class Sample {\n"
          "public:\n"
          "    Sample(int x) {\n"
          "        cout << 'Value: ' << x << endl;\n"
          "    }\n"
          "};\n"
          "int main() {\n"
          "    Sample obj; // Object creation\n"
          "    return 0;\n"
          "}",
      "options": [
        "The constructor must be private",
        "Object creation is incorrect because no arguments are passed",
        "cout syntax is wrong",
        "Constructors cannot have parameters"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Identify the error in this C++ constructor code:\n\n"
          "class Demo {\n"
          "public:\n"
          "    Demo() {\n"
          "        cout << 'Constructor called' << endl;\n"
          "    }\n"
          "};\n"
          "int main() {\n"
          "    Demo obj1;\n"
          "    Demo obj2();\n"
          "    return 0;\n"
          "}",
      "options": [
        "obj2 is incorrectly declared as a function",
        "obj1 should be a pointer",
        "The constructor should return a value",
        "The constructor must be private"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the issue in the following code?\n\n"
          "class Test {\n"
          "public:\n"
          "    Test(int a) {\n"
          "        cout << 'Value: ' << a << endl;\n"
          "    }\n"
          "    Test() {\n"
          "        cout << 'Default constructor' << endl;\n"
          "    }\n"
          "};\n"
          "int main() {\n"
          "    Test obj(10);\n"
          "    return 0;\n"
          "}",
      "options": [
        "Constructors cannot be overloaded",
        "The order of constructors is incorrect",
        "The default constructor is never used",
        "There is a missing return type"
      ],
      "answer": 2,
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
        title: const Text("Constructor Quiz",
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
