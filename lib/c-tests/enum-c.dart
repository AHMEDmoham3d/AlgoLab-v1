       "A type that represents integer constants",
        "A type that represents floating-point constants",
        "A type that can store a sequence of strings",
        "A type that stores a list of function pointers"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the default value of an enum member if no value is explicitly assigned?\n\n"
              "```c\n"
              "enum Color { RED, GREEN, BLUE };\n"
              "```",
      "options": ["0", "1", "Undefined", "The maximum value of the enum type"],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "How can we assign a specific value to an enum member in C?\n\n"
              "```c\n"
              "enum Color { RED = 10, GREEN = 20, BLUE = 30 };\n"
              "```",
      "options": [
        "Using the assignment operator '=' during declaration",
        "By using a constructor",
        "By defining a function to assign values",
        "Values cannot be assigned to enums in C"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the size of an enum variable in C?\n\n"
          "```c\n"
          "enum Color { RED, GREEN, BLUE };\n"
          "```",
      "options": [
        "It depends on the system and the enum size",
        "Always 1 byte",
        "Always 4 bytes",
        "It is not fixed and depends on the number of enum members"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "Which of the following is a valid C enum declaration?\n\n"
          "```c\n"
          "enum Days { SUNDAY, MONDAY, TUESDAY };\n"
          "```",
      "options": [
        "enum Days = { SUNDAY, MONDAY, TUESDAY }",
        "enum Days { SUNDAY, MONDAY, TUESDAY }",
        "enum { SUNDAY, MONDAY, TUESDAY } Days",
        "None of the above"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question": "What is the underlying type of an enum in C?\n\n"
          "```c\n"
          "enum Color { RED, GREEN, BLUE };\n"
          "```",
      "options": [
        "It is always an integer type",
        "It can be any numeric type",
        "It is determined by the first enum member",
        "Enum values are not tied to any underlying type"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "How do you convert an enum value to an integer in C?\n\n"
          "```c\n"
          "enum Color { RED, GREEN, BLUE };\n"
          "```",
      "options": [
        "By casting it to an integer type",
        "By using a special conversion function",
        "By performing arithmetic operations",
        "Enum values cannot be converted to integers in C"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "How do you iterate over the values of an enum in C?\n\n"
          "```c\n"
          "enum Color { RED, GREEN, BLUE };\n"
          "```",
      "options": [
        "By using a loop and casting the enum to an integer",
        "By using a for-each loop",
        "Enums cannot be iterated over directly",
        "By using the enum values as indices"
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
