// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ScanfPage extends StatefulWidget {
  const ScanfPage({super.key});

  @override
  _ScanfPageState createState() => _ScanfPageState();
}

class _ScanfPageState extends State<ScanfPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "Find the error in the following C code:\n int number;\nscanf('%d', number);\nprintf('Number: %d', number);  ",
      "code": '''
    int number;
    scanf("%d", number);
    printf("Number: %d", number);
    ''',
      "options": [
        "Missing '&' before number",
        "Should use %i instead of %d",
        "Variable number must be float",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Find the error in the following C code:\nfloat price;\nscanf('%d', &price);\nprintf('Price: %.2f', price);",
      "code": '''
    float price;
    scanf("%d", &price);
    printf("Price: %.2f", price);
    ''',
      "options": [
        "Should use %f instead of %d in scanf",
        "Missing '&' before price",
        "Should use %lf instead of %f",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          'Find the error in the following C code:\nchar name[20];\nscanf("%s", name);\nprintf("Hello, %s!", name);',
      "code": '''
    char name[20];
    scanf("%s", name);
    printf("Hello, %s!", name);
    ''',
      "options": [
        "May cause buffer overflow",
        "Should use '&' before name",
        "Should use %c instead of %s",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          'Find the error in the following C code:\ndouble value;\nscanf("%lf", value);\nprintf("Value: %lf", value);',
      "code": '''
    double value;
    scanf("%lf", value);
    printf("Value: %lf", value);
    ''',
      "options": [
        "Missing '&' before value",
        "Should use %f instead of %lf",
        "Should use int instead of double",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          'Find the error in the following C code:\nchar ch;\nscanf("%c", &ch);\nprintf("Character: %c", ch)',
      "code": '''
    char ch;
    scanf("%c", &ch);
    printf("Character: %c", ch);
    ''',
      "options": [
        "scanf may read a whitespace character instead of input",
        "Should use &ch twice",
        "ch should be defined as int",
        "No error"
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
        title: const Text("Scanf Quiz",
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
