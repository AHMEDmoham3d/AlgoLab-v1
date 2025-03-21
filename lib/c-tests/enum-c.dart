// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class EnumtPage extends StatefulWidget {
  const EnumtPage({super.key});

  @override
  _EnumtPageState createState() => _EnumtPageState();
}

class _EnumtPageState extends State<EnumtPage> {
List<Map<String, dynamic>> questions = [
  {
    "question": "What is wrong with this enum declaration?\n\n"
        "```c\n"
        "enum Colors { RED = 1, GREEN, BLUE = 1 };\n"
        "```",
    "options": [
      "Duplicate value assignment",
      "Missing semicolon",
      "Enum should start from 0",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "What is the issue with this enum definition?\n\n"
        "```c\n"
        "enum Days { MONDAY = 1, TUESDAY, MONDAY };\n"
        "```",
    "options": [
      "Duplicate enum name",
      "Incorrect syntax",
      "Enum values must be strings",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "Identify the mistake in this code snippet.\n\n"
        "```c\n"
        "enum Status { ACTIVE, INACTIVE, PENDING; };\n"
        "```",
    "options": [
      "Semicolon after last enum value",
      "Enum names must be lowercase",
      "Missing brackets",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "What is wrong in the following C enum?\n\n"
        "```c\n"
        "enum Shapes { CIRCLE, SQUARE = 10, TRIANGLE = 5 };\n"
        "```",
    "options": [
      "Inconsistent value ordering",
      "Enum should have default values only",
      "Enums cannot have numbers",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "Find the mistake in this enum usage.\n\n"
        "```c\n"
        "enum Fruits { APPLE = 'A', BANANA, ORANGE };\n"
        "```",
    "options": [
      "Enum values cannot be characters",
      "Enum must start with a number",
      "Missing a semicolon",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "What is wrong with this enum declaration?\n\n"
        "```c\n"
        "enum Cars { TOYOTA, FORD = 2.5, BMW };\n"
        "```",
    "options": [
      "Enum values must be integers",
      "Enum names must be in uppercase",
      "Missing assignment operator",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "Identify the mistake in this enum.\n\n"
        "```c\n"
        "enum Planets { MERCURY, VENUS = MERCURY + 2, EARTH = VENUS - 1 };\n"
        "```",
    "options": [
      "Invalid arithmetic operation",
      "Enum values must be unique",
      "Missing closing brace",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "What issue is present in this C enum?\n\n"
        "```c\n"
        "enum Animals { CAT, DOG, CAT = 3 };\n"
        "```",
    "options": [
      "Duplicate enum name",
      "Incorrect value assignment",
      "Enum names cannot contain digits",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "Find the mistake in this enum example.\n\n"
        "```c\n"
        "enum Sizes { SMALL = 1, MEDIUM = SMALL + 2, LARGE = BIG };\n"
        "```",
    "options": [
      "Undefined reference to BIG",
      "Enum values must be sequential",
      "Enum must end with a semicolon",
      "No error"
    ],
    "answer": 0,
    "selected": -1
  },
  {
    "question": "What mistake does this enum contain?\n\n"
        "```c\n"
        "enum Status { OK, ERROR, WARNING };\n"
        "int main() {\n"
        "    Status s = 1;\n"
        "    return 0;\n"
        "}\n"
        "```",
    "options": [
      "Enum type must be specified before variable",
      "Enum cannot be used as an integer",
      "Enum must be inside a function",
      "No error"
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
        title: const Text("Enum Quiz",
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
               �s e d n h  �c 4 G S   ��  �����EDNHC~1     DG{RZRZ H{RZ��  �e . d a r  lt   ��������  �����l a n g u  la g e s _ p   a g �ANGUA~1DAR  DG{RZRZ  H{RZ  �  �s e d R b  `y I M i   ��  �����EDRBY~1     MG{RZRZ H{RZ>�!  �r t   ���� ������������  �����J s T e s  t P a g e .   d a �STEST~1DAR  MG{RZRZ  H{RZ  �!  �s e d 0 E  �0 6 j 5   ��  �����ED0E0~1     XG{RZRZ H{RZJ   �n . d a r  �t   ��������  �����c o n t a  �c t _ s c r   e e �ONTAC~1DAR  XG{RZRZ  H{RZ     �m a i n .  Ed a r t   ��  ����               fontSize: 20,
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
