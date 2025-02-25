import 'package:flutter/material.dart';

class FilterTestPage extends StatefulWidget {
  const FilterTestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterTestPageState createState() => _FilterTestPageState();
}

class _FilterTestPageState extends State<FilterTestPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What does the JavaScript filter() method do?",
      "code":
          "const numbers = [1, 2, 3, 4, 5];\nconst result = numbers.filter(num => num > 2);",
      "options": [
        "Filters out elements greater than 2",
        "Filters out elements less than 2",
        "Returns all elements",
        "Throws an error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What will be the output of the following code?",
      "code":
          "const words = ['apple', 'banana', 'grape'];\nconst filtered = words.filter(word => word.includes('a'));",
      "options": [
        "['apple', 'banana', 'grape']",
        "['apple', 'banana']",
        "['grape']",
        "[]"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "How does filter() differ from map()?",
      "code": "[1, 2, 3, 4].filter(x => x > 2);",
      "options": [
        "filter removes elements, map transforms them",
        "Both do the same thing",
        "map removes elements, filter transforms them",
        "filter and map cannot be used together"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What happens if filter() returns false for all elements?",
      "code":
          "const nums = [10, 20, 30];\nconst filtered = nums.filter(n => n > 50);",
      "options": [
        "It throws an error",
        "It returns an empty array",
        "It returns the original array",
        "It returns null"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "Which statement is true about filter()?",
      "code":
          "const arr = [1, 2, 3, 4];\nconst newArr = arr.filter(n => n % 2 === 0);",
      "options": [
        "It modifies the original array",
        "It returns a new array",
        "It returns only odd numbers",
        "It returns undefined"
      ],
      "answer": 1,
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
          "filter Quiz",
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
