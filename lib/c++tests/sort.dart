// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  _SortPageState createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "What is the error in the following C++ bubble sort implementation?\n\n"
              "void bubbleSort(int arr[], int n) {\n"
              "    for (int i = 0; i < n; i++) {\n"
              "        for (int j = 0; j < n - i; j++) {\n"
              "            if (arr[j] > arr[j + 1]) {\n"
              "                swap(arr[j], arr[j + 1]);\n"
              "            }\n"
              "        }\n"
              "    }\n"
              "}",
      "options": [
        "Loop condition should be j < n - i - 1",
        "swap function should be defined manually",
        "Loop should start from i = 1",
        "Array should be passed by reference"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question":
          "What is the issue in the following Quick Sort partition function?\n\n"
              "int partition(int arr[], int low, int high) {\n"
              "    int pivot = arr[low];\n"
              "    int i = low;\n"
              "    for (int j = low + 1; j <= high; j++) {\n"
              "        if (arr[j] < pivot) {\n"
              "            i++;\n"
              "            swap(arr[i], arr[j]);\n"
              "        }\n"
              "    }\n"
              "    swap(arr[i], arr[low]);\n"
              "    return i;\n"
              "}",
      "options": [
        "Pivot should be the last element, not the first",
        "swap(arr[i], arr[low]) should be swap(arr[i], arr[high])",
        "Loop should start from j = low instead of j = low + 1",
        "The function does not return the correct pivot index"
      ],
      "answer": 1,
      "selected": -1
    },
    {
      "question":
          "What is the mistake in this Selection Sort implementation?\n\n"
              "void selectionSort(int arr[], int n) {\n"
              "    for (int i = 0; i < n - 1; i++) {\n"
              "        int minIdx = i;\n"
              "        for (int j = i + 1; j < n; j++) {\n"
              "            if (arr[j] > arr[minIdx]) {\n"
              "                minIdx = j;\n"
              "            }\n"
              "        }\n"
              "        swap(arr[i], arr[minIdx]);\n"
              "    }\n"
              "}",
      "options": [
        "The comparison operator should be '<' instead of '>'",
        "Loop condition should be j <= n instead of j < n",
        "swap function should be replaced with a manual swap",
        "minIdx should be initialized to 0 instead of i"
      ],
      "answer": 0,
      "selected": -1
    },
    {
      "question": "What is the error in this Merge Sort implementation?\n\n"
          "void merge(int arr[], int l, int m, int r) {\n"
          "    int n1 = m - l;\n"
          "    int n2 = r - m;\n"
          "    int L[n1], R[n2];\n"
          "    for (int i = 0; i < n1; i++) L[i] = arr[l + i];\n"
          "    for (int j = 0; j < n2; j++) R[j] = arr[m + j];\n"
          "    int i = 0, j = 0, k = l;\n"
          "    while (i < n1 && j < n2) {\n"
          "        if (L[i] <= R[j]) arr[k++] = L[i++];\n"
          "        else arr[k++] = R[j++];\n"
          "    }\n"
          "    while (i < n1) arr[k++] = L[i++];\n"
          "    while (j < n2) arr[k++] = R[j++];\n"
          "}",
      "options": [
        "Array sizes should be (m - l + 1) and (r - m + 1)",
        "Array indices are incorrect in copying subarrays",
        "Stack overflow due to recursive calls",
        "Dynamic memory allocation should be used instead of stack arrays"
      ],
      "answer": 3,
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
          "Sort Quiz",
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
