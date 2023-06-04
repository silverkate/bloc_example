import 'package:bloc_example/models/joke/joke_model.dart';

class JokeConverter {
  /// Converts a raw [json] to the [JokeModel] instance.
  static JokeModel fromJson(Map<String, dynamic> json) {
    return JokeModel(
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
