import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizlr/model/quiz.dart';
import 'package:quizlr/network/http_client.dart';
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
  late Future<Quiz> _futureFollowing;
  late Future<Quiz> _futureForYou;

  late Timer _timer;
  int _timeTotal = 0;

  @override
  void initState() {
    super.initState();
    _futureFollowing = getFollowing();
    _futureForYou = getForYou();

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _timeTotal += 1;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            TabBarView(
              children: [
                FutureBuilder<Quiz>(
                    future: _futureFollowing,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PageView(
                          scrollDirection: Axis.vertical,
                          children: [
                            QuizItem(quiz: snapshot.data!),
                            QuizItem(quiz: snapshot.data!),
                            QuizItem(quiz: snapshot.data!),
                            QuizItem(quiz: snapshot.data!),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
                FutureBuilder<Quiz>(
                    future: _futureForYou,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PageView(
                          scrollDirection: Axis.vertical,
                          children: [
                            QuizItem(quiz: snapshot.data!),
                            QuizItem(quiz: snapshot.data!),
                            QuizItem(quiz: snapshot.data!),
                            QuizItem(quiz: snapshot.data!),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TimerWidget(
                      remainingTime: _timeTotal,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
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
                  const Spacer(),
                  const Padding(
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
