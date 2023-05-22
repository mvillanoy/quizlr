import 'package:flutter/material.dart';
import 'package:quizlr/constants/styles.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key, required this.playlistName});

  final String playlistName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrayDark,
      height: 40,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.video_library,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              playlistName,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
