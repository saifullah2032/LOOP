import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MusicPadApp());
}

class MusicPadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Music Pad",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> pads = [
    {"label": "Kick Fallen", "color": Colors.red.shade700, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Clap Fallen", "color": Colors.red.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Tops Fallen", "color": Colors.orange.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Bass Fallen", "color": Colors.green.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Chords Fallen", "color": Colors.teal.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Vocal Fallen", "color": Colors.pink.shade300, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Adds Fallen", "color": Colors.purple.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "FX Fallen", "color": Colors.blue.shade500, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Kick Yours", "color": Colors.red.shade700, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Clap Yours", "color": Colors.red.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Tops Yours", "color": Colors.orange.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Bass Yours", "color": Colors.green.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Chords Yours", "color": Colors.teal.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Vocal Yours", "color": Colors.pink.shade300, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Adds Yours", "color": Colors.purple.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "FX Yours", "color": Colors.blue.shade500, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Kick Eventually", "color": Colors.red.shade700, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Clap Eventually", "color": Colors.red.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Tops Eventually", "color": Colors.orange.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Bass Eventually", "color": Colors.green.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Chords Eventually", "color": Colors.teal.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Lead Eventually", "color": Colors.pink.shade300, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Adds Eventually", "color": Colors.purple.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "FX Eventually", "color": Colors.blue.shade500, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Kick Glittering", "color": Colors.red.shade700, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Clap Glittering", "color": Colors.red.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Tops Glittering", "color": Colors.orange.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Bass Glittering", "color": Colors.green.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Chords Glittering", "color": Colors.teal.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Lead Glittering", "color": Colors.pink.shade300, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Adds Glittering", "color": Colors.purple.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "FX Glittering", "color": Colors.blue.shade500, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Kick Hunted", "color": Colors.red.shade700, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Clap Hunted", "color": Colors.red.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Tops Hunted", "color": Colors.orange.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Bass Hunted", "color": Colors.green.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Chords Hunted", "color": Colors.teal.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Lead Hunted", "color": Colors.pink.shade300, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Adds Hunted", "color": Colors.purple.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "FX Hunted", "color": Colors.blue.shade500, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Kick Crises", "color": Colors.red.shade700, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Clap Crises", "color": Colors.red.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Tops Crises", "color": Colors.orange.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Bass Crises", "color": Colors.green.shade600, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Chords Crises", "color": Colors.teal.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Lead Crises", "color": Colors.pink.shade300, "audio": "Disco Raja - Remix.mp3"},
    {"label": "Adds Crises", "color": Colors.purple.shade400, "audio": "Disco Raja - Remix.mp3"},
    {"label": "FX Crises", "color": Colors.blue.shade500, "audio": "Disco Raja - Remix.mp3"},
  ];

  @override
  Widget build(BuildContext context) {
    const int columns = 8;
    const int rows = 6;

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: SafeArea(
        child: Column(
          children: [
            // Top Control Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: const Color(0xFF20232A),
              child: Row(
                children: [
                  // Home icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(Icons.music_note, color: Colors.white, size: 28),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.home, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "DANCEFLOOR POP",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "D#m",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: CircularProgressIndicator(
                          value: 0.7,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          backgroundColor: Colors.white24,
                          strokeWidth: 3,
                        ),
                      ),
                      const Text(
                        "120",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  _topBarButton("Loop", selected: true),
                  _topBarButton("Seq"),
                  _topBarButton("Drum"),
                  _topBarButton("Song"),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.fiber_manual_record, color: Colors.redAccent, size: 18),
                        const SizedBox(width: 6),
                        const Text(
                          "Rec",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ),
            // Pads + Sidebar
            Expanded(
              child: Row(
                children: [
                  // Pads grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final double padWidth = (constraints.maxWidth - (columns - 1) * 8) / columns;
                          final double padHeight = (constraints.maxHeight - (rows - 1) * 8) / rows;
                          return Column(
                            children: List.generate(rows, (row) {
                              return Row(
                                children: List.generate(columns, (col) {
                                  int idx = row * columns + col;
                                  final pad = pads[idx];
                                  return Container(
                                    width: padWidth,
                                    height: padHeight,
                                    margin: EdgeInsets.only(
                                      right: col < columns - 1 ? 8 : 0,
                                      bottom: row < rows - 1 ? 8 : 0,
                                    ),
                                    child: PadPlayer(
                                      label: pad["label"],
                                      color: pad["color"],
                                      audio: pad["audio"],
                                    ),
                                  );
                                }),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                  // Right Sidebar
                  Container(
                    width: 54,
                    margin: const EdgeInsets.only(left: 8),
                    color: const Color(0xFF20232A),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _sideBarButton(Icons.edit, Colors.white),
                        const SizedBox(height: 16),
                        _sideBarButton(Icons.library_add, Colors.white),
                        const SizedBox(height: 16),
                        _sideBarButton(Icons.graphic_eq, Colors.white),
                        const SizedBox(height: 16),
                        _sideBarButton(Icons.folder, Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _topBarButton(String text, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.white24 : Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  static Widget _sideBarButton(IconData icon, Color color) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }
}

// PadPlayer widget for each pad
class PadPlayer extends StatefulWidget {
  final String label;
  final Color color;
  final String audio;

  const PadPlayer({
    required this.label,
    required this.color,
    required this.audio,
    Key? key,
  }) : super(key: key);

  @override
  State<PadPlayer> createState() => _PadPlayerState();
}

class _PadPlayerState extends State<PadPlayer> {
  late AudioPlayer _player;
  double _progress = 0.0;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.onPositionChanged.listen((position) async {
      final duration = await _player.getDuration();
      if (duration != null && duration.inMilliseconds > 0) {
        setState(() {
          _progress = position.inMilliseconds / duration.inMilliseconds;
        });
      }
    });
    _player.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _progress = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _play() async {
    await _player.stop();
    await _player.play(AssetSource('audio/${widget.audio}'));
    setState(() {
      _isPlaying = true;
      _progress = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _play,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                value: _isPlaying ? _progress : null,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8)),
                backgroundColor: Colors.white24,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
