import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quizlr/constants/styles.dart';
import 'package:quizlr/model/quiz.dart';
import 'package:quizlr/ui/quiz/components/item_controls.dart';
import 'package:quizlr/ui/quiz/components/option_item.dart';
import 'package:quizlr/ui/quiz/components/playlist.dart';
import 'package:quizlr/ui/quiz/components/survey.dart';

class QuizItem extends StatefulWidget {
  const QuizItem({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.quiz.type == QuizType.flashcard) {
          setState(() {
            showAnswer = !showAnswer;
          });
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kTealDark,
              kTealMedium,
              kTealLight,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        _getQuestionView(),
                        if (widget.quiz.type == QuizType.mcq) ...[
                          const SizedBox(
                            height: 16,
                          ),
                          _getChoicesView(),
                        ],
                        if (showAnswer) ...[
                          const SizedBox(
                            height: 16,
                          ),
                          _getAnswerView(),
                        ],
                        const Spacer(),
                        if (showAnswer) ...[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: SurveyWidget(),
                          ),
                        ],
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 16),
                          child: Text(
                            widget.quiz.user.name,
                            style: kTextStyleTitle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            widget.quiz.description,
                            style: kTextStyleDescription,
                          ),
                        ),
                      ],
                    ),
                  ),
                  QuestionControls(quiz: widget.quiz),
                ],
              ),
            ),
            PlaylistWidget(playlistName: widget.quiz.playlist),
          ],
        ),
      ),
    );
  }

  Widget _getQuestionView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AutoSizeText(
        widget.quiz.type == QuizType.flashcard
            ? widget.quiz.flashcardFront ?? ""
            : widget.quiz.question ?? "",
        style: kTextStyleQuestion,
        maxLines: 4,
      ),
    );
  }

  Widget _getAnswerView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Answer",
            style: kTextStyleAnswer,
          ),
          AutoSizeText(
            widget.quiz.flashcardBack ?? "",
            style: kTextStyleQuestion,
            maxLines: 10,
          ),
        ],
      ),
    );
  }

  Widget _getChoicesView() {
    return ListView.builder(
        itemCount: widget.quiz.options?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: OptionItem(
              option: widget.quiz.options![index],
              isCorrect: false,
            ),
          );
        });
  }
}
