import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key, required this.remainingTime});

  final int remainingTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.timer,
          color: Colors.white54,
        ),
        Text(
          "${remainingTime}m",
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
