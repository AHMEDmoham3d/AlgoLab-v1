// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StringMethodsPage extends StatefulWidget {
  const StringMethodsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StringMethodsPageState createState() => _StringMethodsPageState();
}

class _StringMethodsPageState extends State<StringMethodsPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet str = 'Hello';\nconsole.log(str.toUppercase());\n```",
      "options": [
        "Nothing is wrong",
        "Method name should be `toUpperCase()`",
        "Single quotes should be double quotes",
        "Missing semicolon"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet text = 'JavaScript';\nconsole.log(text.slice(4, -2));\n```",
      "options": [
        "Negative indices are not allowed in `slice()`",
        "String should be an array",
        "Method should be `substring()`",
        "There is no error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet name = 'John';\nconsole.log(name.charAt[1]);\n```",
      "options": [
        "Method should be called with parentheses `charAt(1)`",
        "Index should start from 0",
        "String indexing is not supported in JavaScript",
        "Nothing is wrong"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet str = 'Hello World';\nconsole.log(str.replaceAll('o', 'a'));\n```",
      "options": [
        "`replaceAll()` is not supported in all browsers",
        "Method should be `replace()`",
        "Strings are immutable in JavaScript",
        "There is no error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet text = '  JavaScript  ';\ntext.trim;\nconsole.log(text);\n```",
      "options": [
        "`trim` is a function and should be called with `trim()`",
        "Whitespace cannot be removed from strings",
        "Method should be `slice()`",
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet str = 'abcdef';\nconsole.log(str.substring(-2, 4));\n```",
      "options": [
        "`substring()` does not accept negative indices",
        "Method should be `slice()`",
        "String indices must start from 1",
        "There is no error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet str = 'JavaScript';\nconsole.log(str.indexOf(Script));\n```",
      "options": [
        "String arguments should be enclosed in quotes",
        "Method should be `search()`",
        "Indexing starts from 1",
        "There is no error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nlet str = 'Hello';\nconsole.log(str.repeat(0.5));\n```",
      "options": [
        "`repeat()` only accepts whole numbers",
        "Method should be `replace()`",
        "String must be converted to an array first",
        "There is no error"
      ],
      "answer": 0,
      "selected": -1
    },
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
          "String Methods Quiz",
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
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
    );
  }
}
