import 'package:flutter/material.dart';
import 'package:quizlr/constants/styles.dart';

class SurveyWidget extends StatelessWidget {
  const SurveyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("How well did you know this?"),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            SurveyButton(value: '1', color: kOrangeMedium),
            SurveyButton(value: '2', color: kOrangeLight),
            SurveyButton(value: '3', color: kYellow),
            SurveyButton(value: '4', color: kGreenMedium),
            SurveyButton(value: '5', color: kGreenLight),
          ],
        ),
      ],
    );
  }
}

class SurveyButton extends StatelessWidget {
  const SurveyButton({super.key, required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 43,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: color,
        ),
        child: Text(value),
      ),
    );
  }
}
