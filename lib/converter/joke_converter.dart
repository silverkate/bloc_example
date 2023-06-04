import 'package:bloc_example/models/joke/joke_model.dart';

class JokeConverter {
  static JokeModel fromJson(Map<String, dynamic> json) {
    return JokeModel(
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
