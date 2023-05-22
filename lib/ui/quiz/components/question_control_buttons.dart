import 'package:flutter/material.dart';

class QuestionControlButton extends StatelessWidget {
  const QuestionControlButton(
      {super.key, required this.iconData, required this.value});

  final IconData iconData;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 40,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
