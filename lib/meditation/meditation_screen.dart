import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
      'audio': 'assets/gentle_morning.mp3', // Full asset path
    },
    {
      'title': 'Peaceful Lake',
      'color': Colors.lightBlue[100],
      'image': 'assets/images/peaceful_lake.jpg',
      'audio': 'assets/peaceful_lake.mp3',
    },
    {
      'title': 'Sunrise',
      'color': Colors.pink[100],
      'image': 'assets/images/sunrise.jpg',
      'audio': 'assets/sunrise.mp3',
    },
    {
      'title': 'Soft Piano',
      'color': Colors.purple[100],
      'image': 'assets/images/soft_piano.jpg',
      'audio': 'assets/soft_piano.mp3',
    },
    {
      'title': 'Heaven',
      'color': Colors.blue[100],
      'image': 'assets/images/heaven.jpg',
      'audio': 'assets/heaven.mp3',
    },
    {
      'title': 'Perfect Rain',
      'color': Colors.green[100],
      'image': 'assets/images/perfect_rain.jpg',
      'audio': 'assets/perfect_rain.mp3',
    },
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  void navigateToPlayer(Map<String, dynamic> track) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MusicPlayerScreen(
          title: track['title'],
          imageUrl: track['image'],
          audioUrl: track['audio'], // full asset path passed here
          color: track['color'],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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

class MusicPlayerScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String audioUrl;
  final Color color;

  const MusicPlayerScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
    required this.color,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _player;
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = const Duration(seconds: 60);

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initPlayer();
  }

  void _initPlayer() async {
    await _player.setSource(AssetSource(widget.audioUrl));
    _player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    _player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });

    _player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });

    _playAudio();
  }

  void _playAudio() async {
    await _player.resume();
    setState(() {
      isPlaying = true;
    });
  }

  void _pauseAudio() async {
    await _player.pause();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(widget.imageUrl, height: 250),
            ),
            const SizedBox(height: 30),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 30),
            Slider(
              activeColor: widget.color,
              inactiveColor: widget.color.withOpacity(0.3),
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
              onChanged: (value) {
                _player.seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(position)),
                Text(_formatDuration(duration)),
              ],
            ),
            const SizedBox(height: 30),
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                size: 64,
                color: widget.color,
              ),
              onPressed: () {
                isPlaying ? _pauseAudio() : _playAudio();
              },
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
