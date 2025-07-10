import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({Key? key, required this.score}) : super(key: key);

  String getResultMessage() {
    if (score >= 10) {
      return "High Risk:\nYou may be experiencing serious postpartum depression or suicidal thoughts.\n\nPlease consult a doctor immediately.";
    } else if (score >= 6) {
      return "Moderate Risk:\nYou show signs of depression.\n\nIt's recommended to talk to a mental health professional.";
    } else if (score >= 3) {
      return "Mild Risk:\nYou might be slightly stressed.\n\nConsider some self-care or therapy if it continues.";
    } else {
      return "You're doing well!\nKeep taking care of your mental health and wellbeing.";
    }
  }

  String getEmoji() {
    if (score >= 10) {
      return "😢"; // Very sad
    } else if (score >= 6) {
      return "😟"; // Worried
    } else if (score >= 3) {
      return "😐"; // Neutral face
    } else {
      return "😊"; // Happy
    }
  }

  Color getEmojiColor() {
    if (score >= 10) {
      return Colors.red.shade100;
    } else if (score >= 6) {
      return Colors.orange.shade100;
    } else if (score >= 3) {
      return Colors.yellow.shade100;
    } else {
      return Colors.green.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = getResultMessage();
    final emoji = getEmoji();
    final emojiBg = getEmojiColor();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: const BackButton(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.purple, AppColors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            "Your Mental Health Report",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score: $score",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Emoji display
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: emojiBg,
                shape: BoxShape.circle,
              ),
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 50),
              ),
            ),

            const SizedBox(height: 30),

            // Message card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.pink.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.pink),
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pink,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Go Back", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
