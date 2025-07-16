import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mamoyee/meditation/music_player_screen.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final List<Map<String, dynamic>> tracks = [
    {
      'title': 'Gentle Morning',
      'color': Colors.brown[100],
      'image': 'assets/images/gentle_morning.jpg',
      'audio': 'audio/gentle_morning.mp3',  // <-- no 'assets/' prefix here
    },
    {
      'title': 'Peaceful Lake',
      'color': Colors.lightBlue[100],
      'image': 'assets/images/peaceful_lake.jpg',
      'audio': 'audio/peaceful_lake.mp3',
    },
    {
      'title': 'Sunrise',
      'color': Colors.pink[100],
      'image': 'assets/images/sunrise.jpg',
      'audio': 'audio/sunrise.mp3',
    },
    {
      'title': 'Soft Piano',
      'color': Colors.purple[100],
      'image': 'assets/images/soft_piano.jpg',
      'audio': 'audio/soft_piano.mp3',
    },
    {
      'title': 'Heaven',
      'color': Colors.blue[100],
      'image': 'assets/images/heaven.jpg',
      'audio': 'audio/heaven.mp3',
    },
    {
      'title': 'Perfect Rain',
      'color': Colors.green[100],
      'image': 'assets/images/perfect_rain.jpg',
      'audio': 'audio/perfect_rain.mp3',
    },
  ];

  void navigateToPlayer(Map<String, dynamic> track) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MusicPlayerScreen(
          title: track['title'],
          imageUrl: track['image'],
          audioUrl: track['audio'],
          color: track['color'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/meditation_header.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: Icon(Icons.settings, color: Colors.white),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  "Meditation Music",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 6, color: Colors.black26)],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                final track = tracks[index];
                return GestureDetector(
                  onTap: () => navigateToPlayer(track),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: track['color'],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          track['title'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        ClipOval(
                          child: Image.asset(
                            track['image'],
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
