import 'package:quizlr/model/options.dart';
import 'package:quizlr/model/user.dart';

enum QuizType { flashcard, mcq }

class Quiz {
  Quiz({
    required this.type,
    required this.id,
    required this.playlist,
    this.flashcardFront,
    this.flashcardBack,
    required this.description,
    this.question,
    required this.user,
    this.options,
  });

  QuizType type;
  int id;
  String playlist;
  String? flashcardFront;
  String? flashcardBack;
  String description;
  String? question;
  User user;
  List<Option>? options;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<dynamic> options = json['options'];

    return Quiz(
      type: json['type'],
      id: json['id'],
      playlist: json['playlist'],
      flashcardFront: json['flashcard_front'],
      flashcardBack: json['flashcard_back'],
      description: json['description'],
      question: json['question'],
      user: User.fromJson(json['user']),
      options: List<Option>.from(options.map((i) => Option.fromJson(i))),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'playlist': playlist,
        'flashcard_front': flashcardFront,
        'flashcard_back': flashcardBack,
        'description': description,
        'question': question,
        'user': user,
        'options': options
      };
}

Quiz kQuiz = Quiz(
  type: QuizType.flashcard,
  id: 123,
  playlist: "playlist 1",
  description: "Hello world",
  flashcardFront: "what is my name",
  flashcardBack: "monica",
  user: User(
      name: "AP US History",
      avatar:
          "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"),
);

Quiz kQuiz2 = Quiz(
  type: QuizType.mcq,
  id: 567,
  playlist: "playlist 2",
  description: "Hello earth",
  question: "what is my last nationality",
  user: User(
      name: "AP US History",
      avatar:
          "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"),
  options: [
    Option(id: "A", answer: "German and Irish"),
    Option(id: "B", answer: "Italian and German"),
    Option(id: "C", answer: "Chinese & Japanese"),
  ],
);
