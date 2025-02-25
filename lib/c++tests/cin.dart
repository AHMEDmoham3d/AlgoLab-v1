import 'package:flutter/material.dart';

class CinPage extends StatefulWidget {
  const CinPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CinPageState createState() => _CinPageState();
}

class _CinPageState extends State<CinPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the correct syntax for reading an integer input using cin?",
      "code": "?",
      "options": [
        "cin >> x;", // صحيح
        "cin << x;", // خطأ (يجب أن يكون >> بدلاً من <<)
        "input(x);", // خطأ (ليس من دوال C++)
        "scanf('%d', &x);" // خطأ (استخدام scanf في C وليس C++)
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which header file is required for using cin in C++?",
      "code": "?",
      "options": [
        "#include <iostream>", // صحيح
        "#include <stdio.h>", // ليس للـ cin، يستخدم مع scanf
        "#include <cin.h>", // خطأ (لا يوجد ملف cin.h)
        "#include <string>" // خطأ (لا علاقة له بـ cin)
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "How can you read a full line of input using cin?",
      "code": "?",
      "options": [
        "cin >> line;", // خطأ (سيتوقف عند المسافة الأولى)
        "getline(cin, line);", // صحيح
        "cin.get(line);", // خطأ (دالة get تحتاج إلى حجم)
        "cin.read(line);" // خطأ (تستخدم read مع المصفوفات)
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What happens when cin fails to read an input correctly?",
      "code": "?",
      "options": [
        "It crashes the program", // خطأ (لا يؤدي إلى تعطل البرنامج مباشرة)
        "It sets an error flag", // صحيح
        "It automatically retries", // خطأ (لا يعيد المحاولة تلقائيًا)
        "It skips the input" // خطأ (بل يتوقف الإدخال عند الخطأ)
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the correct way to clear cin's error state?",
      "code": "?",
      "options": [
        "cin.clear();", // صحيح
        "cin.reset();", // خطأ (لا توجد دالة reset للـ cin)
        "cin.ignore();", // خطأ (تستخدم لتخطي الأحرف وليس لمسح الأخطاء)
        "cin.flush();" // خطأ (تستخدم مع المخرجات وليس cin)
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
        title: const Center(
          child: Text("Cin Quiz",
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
