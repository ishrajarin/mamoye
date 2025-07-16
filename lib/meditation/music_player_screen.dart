import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String audioUrl;
  final Color color;

  const MusicPlayerScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
    required this.color,
  }) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _player;
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = const Duration(seconds: 60); // Default if not fetched

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
                  fontSize: 22, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
