// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StructCPage extends StatefulWidget {
  const StructCPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StructCPageState createState() => _StructCPageState();
}

class _StructCPageState extends State<StructCPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Student {\n"
          "    char name[20];\n"
          "    int age;\n"
          "} s;\n\n"
          "int main() {\n"
          "    s.name = \"John\";\n"
          "    s.age = 20;\n"
          "    printf(\"%s %d\", s.name, s.age);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Strings cannot be assigned directly",
        "Missing semicolon after struct definition",
        "Struct members must be private",
        "Incorrect printf format"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Point {\n"
          "    int x, y;\n"
          "};\n\n"
          "int main() {\n"
          "    struct Point p;\n"
          "    printf(\"%d %d\", p.x, p.y);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Struct variables must be initialized",
        "Garbage values will be printed",
        "Missing struct definition",
        "Structs cannot have multiple members"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Employee {\n"
          "    char name[30];\n"
          "    float salary;\n"
          "};\n\n"
          "int main() {\n"
          "    struct Employee e = {\"Alice\", 50000};\n"
          "    printf(\"%s %.2lf\", e.name, e.salary);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Use of incorrect format specifier for float",
        "Salary should be an integer",
        "Struct initialization is incorrect",
        "Cannot use float in struct"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Car {\n"
          "    char model[20];\n"
          "    int year;\n"
          "};\n\n"
          "int main() {\n"
          "    struct Car c1 = {\"Toyota\", 2015};\n"
          "    struct Car c2 = c1;\n"
          "    c2.year = 2020;\n"
          "    printf(\"%s %d\", c1.model, c1.year);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Structs cannot be assigned directly",
        "String initialization is incorrect",
        "c2 does not copy c1 correctly",
        "No error in the code"
      ],
      "answer": 3,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Node {\n"
          "    int data;\n"
          "    struct Node next;\n"
          "};\n\n"
          "int main() {\n"
          "    struct Node n1;\n"
          "    n1.data = 10;\n"
          "    printf(\"%d\", n1.data);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Self-referential struct is incorrect",
        "Struct cannot have integer members",
        "next should be a pointer",
        "Cannot initialize struct members inside main"
      ],
      "answer": 2,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Box {\n"
          "    int width, height, depth;\n"
          "};\n\n"
          "void printBox(struct Box b) {\n"
          "    printf(\"%d %d %d\", b.width, b.height, b.depth);\n"
          "}\n\n"
          "int main() {\n"
          "    printBox({10, 20, 30});\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Cannot pass struct literals directly",
        "printf format is incorrect",
        "Box struct must be defined inside main",
        "Should use pointers instead of passing by value"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in the following C code?\n\n"
          "```c\n"
          "#include <stdio.h>\n"
          "struct Data {\n"
          "    int id;\n"
          "    char name[10];\n"
          "};\n\n"
          "int main() {\n"
          "    struct Data d1 = {1, 'Alex'};\n"
          "    printf(\"%d %s\", d1.id, d1.name);\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "String must be enclosed in double quotes",
        "Struct cannot have integer members",
        "Wrong use of printf format",
        "Cannot initialize struct like this"
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
        title: const Text("Struct Quiz",
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
