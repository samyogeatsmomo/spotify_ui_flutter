import 'package:flutter/material.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  static const Color _grey = Color(0xFFB3B3B3);

  // Change these to your own asset paths (and add them in pubspec.yaml).
  static const String _img = "assets/images/images.jpg";
  static const String _img1 = "assets/images/marvin gaye.jpg";
  static const String _img2 = "assets/images/2021.jpg";
  static const String _img3 = "assets/images/ur top songs 2021jpg.jpg";
  static const String _img4 = "assets/images/ur artists revvealed.jpg";
  static const String _img5 = "assets/images/ed sheeran.jpg";
  static const String _img6 = "assets/images/mitski.jpg";



  // Loads an asset image; shows a dark grey box if the file is missing.
  Widget _image(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          Container(color: Colors.grey.shade800),
    );
  }

  // Circle image with a name underneath.
  Widget _artist(String name, String path) {
    return Column(
      children: [
        ClipOval(
          child: SizedBox(height: 90, width: 90, child: _image(path)),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }

  // Square image with a caption underneath. Expanded so two fit in a Row.
  Widget _card(String path, String caption) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: _image(path),
          ),
          const SizedBox(height: 8),
          Text(
            caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: _grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Recently played",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.history, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Artist circles
            Row(
              children: [
                _artist("Lana Del Rey", _img),
                const SizedBox(width: 16),
                _artist("Marvin Gaye", _img1),
              ],
            ),
            const SizedBox(height: 24),

            // 2021 in review header
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: SizedBox(height: 42, width: 42, child: _image(_img2)),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#SPOTIFYWRAPPED",
                        style: TextStyle(color: _grey, fontSize: 9),
                      ),
                      Text(
                        "Your 2021 in review",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Review cards
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _card(_img3, "Your Top Songs 2021"),
                const SizedBox(width: 12),
                _card(_img4, "Your Artists Revealed"),
              ],
            ),
            const SizedBox(height: 24),

            // Editor's picks
            _sectionTitle("Editor's picks"),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _card(_img5, "Ed Sheeran, Big Sean, Juice WRLD, Post Malone"),
                const SizedBox(width: 12),
                _card(_img6, "Mitski, Tame Impala, Glass Animals, Charli XCX"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}