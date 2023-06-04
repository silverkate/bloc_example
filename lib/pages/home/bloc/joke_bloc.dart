import 'package:bloc_example/base/bloc/base_event.dart';
import 'package:bloc_example/base/bloc/base_state.dart';
import 'package:bloc_example/extension/emitter_extension.dart';
import 'package:bloc_example/pages/home/bloc/joke_event.dart';
import 'package:bloc_example/pages/home/bloc/joke_state.dart';
import 'package:bloc_example/provider/joke_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeBloc extends Bloc<BaseEvent, BaseState> {
  JokeBloc() : super(InitState()) {
    on<GetJokeEvent>((event, emit) => emit.streamAsync(_getJoke()));
  }

  final _jokeProvider = JokeProvider();

  Stream<BaseState> _getJoke() async* {
    yield ProgressState();

    try {
      final joke = await _jokeProvider.getJoke();
      yield GotJokeState(joke);
    } catch (e) {
      yield ErrorState(msg: e.toString());
    }
  }
}
