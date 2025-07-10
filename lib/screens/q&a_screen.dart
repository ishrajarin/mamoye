import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../theme/app_colors.dart';

class QAScreen extends StatefulWidget {
  const QAScreen({Key? key}) : super(key: key);

  @override
  State<QAScreen> createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'I have felt sad or miserable recently.',
      'options': ['Never', 'Sometimes', 'Often', 'Always'],
      'scores': [0, 1, 2, 3],
    },
    {
      'question': 'I have had thoughts of harming myself.',
      'options': ['Never', 'Rarely', 'Often', 'Always'],
      'scores': [0, 2, 4, 6],
    },
    {
      'question': 'I have felt overwhelmed or unable to cope with daily tasks.',
      'options': ['Never', 'Sometimes', 'Often', 'Always'],
      'scores': [0, 1, 2, 3],
    },
    {
      'question': 'I have felt disconnected from my baby.',
      'options': ['Never', 'Sometimes', 'Often', 'Always'],
      'scores': [0, 1, 2, 3],
    },
    {
      'question': 'I find it hard to sleep even when the baby is sleeping.',
      'options': ['Never', 'Sometimes', 'Often', 'Always'],
      'scores': [0, 1, 2, 3],
    },
    {
      'question': 'I have experienced sudden mood swings or irritability.',
      'options': ['Never', 'Sometimes', 'Often', 'Always'],
      'scores': [0, 1, 2, 3],
    },
    {
      'question': 'I feel anxious or worried without a clear reason.',
      'options': ['Never', 'Sometimes', 'Often', 'Always'],
      'scores': [0, 1, 2, 3],
    },
  ];

  int currentIndex = 0;
  int totalScore = 0;

  void _handleAnswer(int score) {
    setState(() {
      totalScore += score;
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(score: totalScore),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Scaffold(
      body: Column(
        children: [
          // Gradient AppBar
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE14AA7), Color(0xFFAB54EF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Postpartum Q&A",
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress bar
                  LinearProgressIndicator(
                    value: (currentIndex + 1) / questions.length,
                    backgroundColor: Colors.grey.shade300,
                    color: AppColors.pink,
                  ),
                  const SizedBox(height: 20),

                  // Question
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        currentQuestion['question'],
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Answer buttons with animation
                  ...List.generate(currentQuestion['options'].length, (index) {
                    bool isPressed = false;

                    return StatefulBuilder(
                      builder: (context, setInnerState) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTapDown: (_) => setInnerState(() => isPressed = true),
                            onTapUp: (_) {
                              setInnerState(() => isPressed = false);
                              _handleAnswer(currentQuestion['scores'][index]);
                            },
                            onTapCancel: () => setInnerState(() => isPressed = false),
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 100),
                              scale: isPressed ? 0.96 : 1.0,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: AppColors.pink.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pink.shade200,
                                      offset: const Offset(0, 4),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    currentQuestion['options'][index],
                                    style: const TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
