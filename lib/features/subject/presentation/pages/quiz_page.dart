import 'package:flutter/material.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Which of the following is correct variable declaration?",
              style: TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 20),

            _choice("A. variable = 123", 0),
            _choice("B. 123 = variable", 1),
            _choice("C. let variable = 123", 2),
            _choice("D. dim variable as 123", 3),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ResultPage()),
                );
              },
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }

  Widget _choice(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected == index ? Colors.green : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}