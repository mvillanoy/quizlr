import 'dart:convert';

import 'package:quizlr/model/quiz.dart';
import 'package:http/http.dart' as http;

Future<Quiz> getFollowing() async {
  final response = await http
      .get(Uri.parse('https://cross-platform.rp.devfactory.com/following'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quiz.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Quiz> getForYou() async {
  final response = await http
      .get(Uri.parse('https://cross-platform.rp.devfactory.com/for_you'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quiz.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Quiz> getCorrectAnswer() async {
  final response = await http
      .get(Uri.parse('https://cross-platform.rp.devfactory.com/for_you'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quiz.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
