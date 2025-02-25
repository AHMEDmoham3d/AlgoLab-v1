// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "What is the error in the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <map>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    map<int, string> m;\n"
          "    m.insert(1, \"One\");\n"
          "    cout << m[1] << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "Incorrect use of insert()",
        "Maps do not support indexing",
        "Missing semicolon",
        "Keys must be strings"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the output of the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <map>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    map<int, string> m;\n"
          "    m[1] = \"One\";\n"
          "    m[2] = \"Two\";\n"
          "    m.erase(1);\n"
          "    cout << m.size() << endl;\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": ["1", "2", "0", "Compilation error"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Which of the following is the correct way to insert a key-value pair into a `map` in C++?",
      "options": [
        "m.insert(1, \"One\");",
        "m[1] = \"One\";",
        "m.add(1, \"One\");",
        "m.put(1, \"One\");"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "How do you check if a key exists in a C++ `map`?",
      "options": [
        "m.has(1);",
        "m.find(1) != m.end();",
        "m.exists(1);",
        "m.contains(1);"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What happens when you access a key that does not exist in a C++ `map`?",
      "options": [
        "It throws an exception",
        "It returns a default-constructed value",
        "It returns `nullptr`",
        "Compilation error"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the time complexity of searching for an element in a `map<int, string>` implemented using `std::map`?",
      "options": ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "Which container should be used instead of `std::map` if you need average O(1) time complexity for search operations?",
      "options": [
        "std::vector",
        "std::unordered_map",
        "std::set",
        "std::deque"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "Which of the following is the correct way to iterate over a `map<int, string>` in C++?",
      "options": [
        "for (auto it = m.begin(); it != m.end(); ++it) cout << it->first << \" \" << it->second << endl;",
        "for (it in m) cout << it.first << \" \" << it.second << endl;",
        "foreach (pair in m) cout << pair.first << \" \" << pair.second << endl;",
        "m.loop((k, v) => cout << k << \" \" << v << endl);"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "Which of the following statements about `std::map` in C++ is true?",
      "options": [
        "`std::map` stores elements in an unordered manner",
        "`std::map` automatically sorts elements based on keys",
        "Keys in `std::map` can be duplicated",
        "The default comparison function for `std::map` is `std::greater`"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What will be the output of the following C++ code?\n\n"
          "```cpp\n"
          "#include <iostream>\n"
          "#include <map>\n"
          "using namespace std;\n\n"
          "int main() {\n"
          "    map<int, string> m;\n"
          "    m[5] = \"Five\";\n"
          "    m[3] = \"Three\";\n"
          "    m[8] = \"Eight\";\n"
          "    for (auto& p : m) {\n"
          "        cout << p.first << \" \" << p.second << endl;\n"
          "    }\n"
          "    return 0;\n"
          "}\n"
          "```",
      "options": [
        "5 Five\n3 Three\n8 Eight",
        "3 Three\n5 Five\n8 Eight",
        "8 Eight\n5 Five\n3 Three",
        "The order is unpredictable"
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
        title: const Text("Map Quiz",
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
