import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 1, 95),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(170, 255, 255, 255),
            ),
            const SizedBox(height: 80),
            const Text(
              "Try your luck on our quiz!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_circle_right_outlined, size: 40),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                // Navigate to QuestionsScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionsScreen()),
                );
              },
              label: const Text(
                "Start Quiz",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


