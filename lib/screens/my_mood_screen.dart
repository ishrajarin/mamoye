import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MyMoodScreen extends StatefulWidget {
  const MyMoodScreen({Key? key}) : super(key: key);

  @override
  State<MyMoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MyMoodScreen> {
  String? selectedMood;
  Color backgroundColor = Colors.white;

  final Map<String, Color> moodColors = {
    'Happy': Colors.yellow.shade100,
    'Sad': Colors.blue.shade100,
    'Angry': Colors.red.shade100,
    'Relaxed': Colors.green.shade100,
    'Anxious': Colors.purple.shade100,
    'Excited': Colors.orange.shade100,
  };

  void _setMood(String mood) {
    setState(() {
      selectedMood = mood;
      backgroundColor = moodColors[mood] ?? Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: const BackButton(color: Colors.white),
          title: const Text(
            "How's Your Mood?",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.purple, AppColors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Select your current mood:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: moodColors.keys.map((mood) {
                final isSelected = selectedMood == mood;
                return ChoiceChip(
                  label: Text(
                    mood,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (_) => _setMood(mood),
                  selectedColor: Colors.deepPurple,
                  backgroundColor: Colors.grey.shade200,
                  elevation: 3,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            if (selectedMood != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                  children: [
                    const Text("You're feeling:", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                      selectedMood!,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
