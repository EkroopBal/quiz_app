import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  List<Map<String, String>> results = [];

  void answerQuestion(String selectedAnswer) {
    final currentQuestion = questions[currentQuestionIndex];
    final correctAnswer = currentQuestion.answers[0]; // Assume first answer is correct
    results.add({
      'question': currentQuestion.text,
      'userAnswer': selectedAnswer,
      'correctAnswer': correctAnswer,
    });

    setState(() {
      currentQuestionIndex++;
    });

    if (currentQuestionIndex >= questions.length) {
      // Once all questions are answered, navigate to results screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(results: results),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Questions'),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 60, 1, 93)),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () => answerQuestion(item),
              );
            }),
          ],
        ),
      ),
    );
  }
}

