import 'package:flutter/material.dart';

class ExamsPage extends StatefulWidget {
  const ExamsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExamsPageState createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> {
  double _progress = 0.0;

  // محاكاة الإجابات الصحيحة
  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        if (_progress < 1.0) {
          _progress += 0.1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // صورة
          Image.asset('assets/exam_image.jpg', width: 150, height: 150),

          const SizedBox(height: 20),

          // شريط التقدم
          LinearProgressIndicator(
            value: _progress,
            minHeight: 10,
            backgroundColor: Colors.grey,
            color: Colors.blue,
          ),

          const SizedBox(height: 20),

          // النص الذي يوضح التقدم
          Text(
            'Answered correctly: ${((_progress) * 100).toStringAsFixed(0)}%',
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),

          // محاكاة الإجابة الصحيحة
          ElevatedButton(
            onPressed: () => _answerQuestion(true),
            child: const Text("Answer Correctly"),
          ),

          // محاكاة الإجابة الخطأ
          ElevatedButton(
            onPressed: () => _answerQuestion(false),
            child: const Text("Answer Incorrectly"),
          ),
        ],
      ),
    );
  }
}
