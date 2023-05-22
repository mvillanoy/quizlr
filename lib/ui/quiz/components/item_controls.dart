import 'package:flutter/material.dart';
import 'package:quizlr/model/quiz.dart';
import 'package:quizlr/ui/quiz/components/question_control_buttons.dart';

class QuestionControls extends StatelessWidget {
  const QuestionControls({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(quiz.user.avatar),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const QuestionControlButton(
          iconData: Icons.favorite,
          value: "87",
        ),
        const QuestionControlButton(
          iconData: Icons.insert_comment,
          value: "2",
        ),
        const QuestionControlButton(
          iconData: Icons.reply,
          value: "17",
        ),
        const QuestionControlButton(
          iconData: Icons.sync,
          value: "Flip",
        )
      ],
    );
  }
}
