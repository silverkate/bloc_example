import 'package:bloc_example/base/bloc/base_state.dart';
import 'package:bloc_example/models/joke/joke_model.dart';

class GotJokeState extends BaseState {
  GotJokeState(this.joke);

  final JokeModel joke;
}
