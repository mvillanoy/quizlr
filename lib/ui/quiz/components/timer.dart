import 'package:flutter/material.dart';
import 'package:quizlr/utils/time_utils.dart';

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
          timeAgo(remainingTime),
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
