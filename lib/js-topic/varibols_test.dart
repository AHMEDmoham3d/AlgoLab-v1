import 'package:flutter/material.dart';

class VaribolsTestPage extends StatefulWidget {
  const VaribolsTestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VaribolsTestPageState createState() => _VaribolsTestPageState();
}

class _VaribolsTestPageState extends State<VaribolsTestPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in the following variable declaration?\n\n```js\nvar 1number = 10;\n```",
      "options": [
        "A variable cannot start with a number",
        "let should be used instead of var",
        "A string value must be enclosed in quotes",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with the following code?\n\n```js\nconst name = \"John\";\nname = \"Doe\";\n```",
      "options": [
        "The variable name is undefined",
        "A const variable cannot be reassigned",
        "name should be defined using var",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following code?\n\n```js\nlet x = 5;\nlet x = 10;\n```",
      "options": [
        "A let variable cannot be redeclared in the same scope",
        "const should be used instead of let",
        "A new value must be assigned to x",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following code?\n\n```js\nconsole.log(y);\nlet y = 20;\n```",
      "options": [
        "The variable y is undefined",
        "Cannot access let before initialization",
        "y should be declared using var",
        "No error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the error in the following variable declaration?\n\n```js\nvar my-var = 50;\n```",
      "options": [
        "A variable name cannot contain a hyphen (-)",
        "The variable should be declared using let",
        "const should be used instead of var",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is wrong with this code related to data types?\n\n```js\nlet isActive = 'true';\nif (isActive === true) {\n  console.log(\"Active\");\n}\n```",
      "options": [
        "String and boolean types are being compared",
        "The if condition is written incorrectly",
        "isActive should be defined as a number",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue with the following code?\n\n```js\nvar undefined = 10;\nconsole.log(undefined);\n```",
      "options": [
        "You cannot use 'undefined' as a variable name",
        "console.log is incorrect",
        "var should be replaced with let",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Find the error in the following code:\n\n```js\nlet number = 5;\nnumber = \"five\";\nconsole.log(number);\n```",
      "options": [
        "You cannot assign a string to a number variable",
        "Use var instead of let",
        "You must use parseInt() for conversion",
        "No error"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question":
          "What is wrong with this declaration?\n\n```js\nconst obj = {name: 'John'};\nobj = {name: 'Doe'};\n```",
      "options": [
        "You cannot reassign a constant object",
        "The object should be declared using let",
        "You must use Object.freeze()",
        "No error"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the error in this code?\n\n```js\nvar null = 0;\nconsole.log(null);\n```",
      "options": [
        "You cannot use 'null' as a variable name",
        "console.log is used incorrectly",
        "var should be replaced with let",
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
        title: const Text("varibols Quiz",
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
