import 'package:flutter/material.dart';
import 'quiz_page.dart';

class SubjectDetailPage extends StatelessWidget {
  final String title;

  const SubjectDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Your Progress\nComplete 2/10 sets\nBest Score: 80%",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _setItem(context, "Set 1: Variables"),
                  _setItem(context, "Set 2: If-Else"),
                  _setItem(context, "Set 3: Loops"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setItem(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizPage()),
              );
            },
            child: const Text("Start"),
          ),
        ],
      ),
    );
  }
}