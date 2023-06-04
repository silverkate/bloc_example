import 'package:bloc_example/api/joke_api.dart';
import 'package:bloc_example/models/joke/joke_model.dart';

/// The provider.
class JokeProvider {
  JokeProvider();

  final _jokeApi = JokeApi();

  Future<JokeModel> getJoke() => _jokeApi.getJoke();
}
