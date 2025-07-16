import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// --- Mood Data Model ---
class MoodEntry {
  final DateTime date;
  final String mood;
  final Color color;

  MoodEntry({
    required this.date,
    required this.mood,
    required this.color,
  });
}

// --- Mood Tracker Screen ---
class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  String? _selectedMood;

  final List<MoodEntry> _moodHistory = [
    MoodEntry(
      date: DateTime.now(),
      mood: 'Overwhelmed',
      color: const Color(0xFFF9EAE1),
    ),
    MoodEntry(
      date: DateTime.now().subtract(const Duration(days: 1)),
      mood: 'Hopeful',
      color: const Color(0xFFE9D5F5),
    ),
    MoodEntry(
      date: DateTime.now().subtract(const Duration(days: 2)),
      mood: 'Calm',
      color: const Color(0xFFDBF0F8),
    ),
  ];

  final List<Map<String, dynamic>> _moodOptions = [
    {'mood': 'Happy', 'emoji': '😊', 'color': const Color(0xFFFBF8D2)},
    {'mood': 'Calm', 'emoji': '😌', 'color': const Color(0xFFDBF0F8)},
    {'mood': 'Energetic', 'emoji': '😁', 'color': const Color(0xFFDCF8DE)},
    {'mood': 'Stressed', 'emoji': '😩', 'color': const Color(0xFFFADAE5)},
    {'mood': 'Sad', 'emoji': '😢', 'color': const Color(0xFFD6E3F4)},
    {'mood': 'Overwhelmed', 'emoji': '😵‍💫', 'color': const Color(0xFFF9EAE1)},
    {'mood': 'Tired', 'emoji': '😴', 'color': const Color(0xFFF3F3F3)},
    {'mood': 'Hopeful', 'emoji': '✨', 'color': const Color(0xFFE9D5F5)},
    {'mood': 'Grateful', 'emoji': '🙏', 'color': const Color(0xFFE2F3D9)},
    {'mood': 'Confused', 'emoji': '😕', 'color': const Color(0xFFFFE3B3)},
    {'mood': 'Relaxed', 'emoji': '🌿', 'color': const Color(0xFFDEF7EC)},
    {'mood': 'Bored', 'emoji': '😐', 'color': const Color(0xFFE5E5E5)},
  ];


  void _logMood() {
    if (_selectedMood != null) {
      setState(() {
        final selectedOption =
        _moodOptions.firstWhere((option) => option['mood'] == _selectedMood);
        _moodHistory.insert(
          0,
          MoodEntry(
            date: DateTime.now(),
            mood: _selectedMood!,
            color: selectedOption['color'],
          ),
        );
        _selectedMood = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('My Mood'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'How are you feeling today?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),

            // Mood selection grid
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12.0,
              runSpacing: 12.0,
              children: _moodOptions.map((option) {
                final bool isSelected = _selectedMood == option['mood'];
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedMood = option['mood']);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: option['color'],
                      borderRadius: BorderRadius.circular(12.0),
                      border: isSelected
                          ? Border.all(
                        color: Colors.black54,
                        width: 1.5,
                      )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(option['emoji'], style: const TextStyle(fontSize: 24)),
                        const SizedBox(height: 2),
                        Text(
                          option['mood'],
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 25),

            // Log Mood Button
            ElevatedButton(
              onPressed: _selectedMood != null ? _logMood : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedMood != null
                    ? const Color(0xFFC09BBD)
                    : const Color(0xFFC09BBD).withOpacity(0.5),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text(
                'Log My Mood',
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 30),

            // Mood History
            Text(
              'Your Mood Journey',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _moodHistory.length,
              itemBuilder: (context, index) {
                final entry = _moodHistory[index];
                return Card(
                  color: entry.color,
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  elevation: 1,
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    leading: Icon(_getIconForMood(entry.mood), size: 18),
                    title: Text(
                      entry.mood,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('MMM d, yyyy').format(entry.date),
                      style: const TextStyle(fontSize: 9),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForMood(String mood) {
    switch (mood) {
      case 'Happy':
        return Icons.sentiment_very_satisfied;
      case 'Calm':
        return Icons.sentiment_satisfied;
      case 'Energetic':
        return Icons.emoji_emotions;
      case 'Stressed':
        return Icons.sentiment_dissatisfied;
      case 'Sad':
        return Icons.sentiment_very_dissatisfied;
      case 'Overwhelmed':
        return Icons.cloud_outlined;
      case 'Tired':
        return Icons.bedtime;
      case 'Hopeful':
        return Icons.lightbulb_outline;
      case 'Grateful':
        return Icons.favorite_border;
      case 'Tired':
        return Icons.bedtime;
      case 'Hopeful':
        return Icons.lightbulb_outline;
      case 'Cool':
        return Icons.color_lens_rounded;
      default:
        return Icons.mood;
    }
  }
}
