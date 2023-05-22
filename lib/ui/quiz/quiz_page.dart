import 'package:flutter/material.dart';
import 'package:quizlr/model/quiz.dart';
import 'package:quizlr/ui/components/coming_soon.dart';
import 'package:quizlr/ui/quiz/components/quiz_item.dart';

import 'components/timer.dart';

final PageController mangaBrowserController = PageController();
final PageController mangaReaderController = PageController();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            TabBarView(
              children: [
                PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    QuizItem(quiz: kQuiz),
                    QuizItem(quiz: kQuiz2),
                    QuizItem(quiz: kQuiz),
                    QuizItem(quiz: kQuiz2),
                  ],
                ),
                PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    QuizItem(quiz: kQuiz2),
                    QuizItem(quiz: kQuiz),
                    QuizItem(quiz: kQuiz2),
                    QuizItem(quiz: kQuiz),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TimerWidget(
                      remainingTime: 10,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 200,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          text: "For You",
                        ),
                        Tab(
                          text: "Following",
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.search),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
