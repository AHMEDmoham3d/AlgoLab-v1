import 'package:flutter/material.dart';

class SwitchTestPage extends StatefulWidget {
  const SwitchTestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchTestPageState createState() => _SwitchTestPageState();
}

class _SwitchTestPageState extends State<SwitchTestPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": ""
          "switch(value) {\n"
          "  case 1:\n"
          "    console.log('One');\n"
          "  case 2:\n"
          "    console.log('Two');\n"
          "  default:\n"
          "    console.log('Default case');\n"
          "}",
      "options": [
        "Missing 'break' statements",
        "Incorrect use of 'case'",
        "Switch statement cannot have a default case",
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": ""
          "switch(5) {\n"
          "  case '5':\n"
          "    console.log('Match');\n"
          "    break;\n"
          "  default:\n"
          "    console.log('No Match');\n"
          "}",
      "options": [
        "Incorrect syntax in switch",
        "Strict comparison issue between number and string",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": ""
          "switch(x) {\n"
          "  case 10:\n"
          "    console.log('Ten');\n"
          "    break;\n"
          "  case 20:\n"
          "    console.log('Twenty');\n"
          "  break\n"
          "  default:\n"
          "    console.log('Other');\n"
          "}",
      "options": [
        "Missing colon ':' after 'case 20'",
        "Switch statement must always have a default case",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": ""
          "switch(x) {\n"
          "  case 1:\n"
          "    let y = 10;\n"
          "    break;\n"
          "  case 2:\n"
          "    console.log(y);\n"
          "    break;\n"
          "}",
      "options": [
        "Variable 'y' is not defined in case 2",
        "Switch must have an 'else' case",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": ""
          "switch(x) {\n"
          "  case 1:\n"
          "    console.log('One');\n"
          "  break;\n"
          "  case 2:\n"
          "    console.log('Two')\n"
          "    break;\n"
          "  default:\n"
          "    console.log('Default case');\n"
          "}",
      "options": [
        "Missing semicolon in case 2",
        "Switch must have a 'return' statement",
        "Cannot use console.log inside switch",
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
        title: const Text(
          "switch Quiz",
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
            : SingleChildScrollView(
                // إضافة التمرير عند الحاجة
                child: Padding(
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
                              fontSize: 18,
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
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
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
      ),
    );
  }
}
