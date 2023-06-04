import 'package:bloc_example/base/bloc/base_state.dart';
import 'package:bloc_example/pages/home/bloc/joke_bloc.dart';
import 'package:bloc_example/pages/home/bloc/joke_event.dart';
import 'package:bloc_example/pages/home/bloc/joke_state.dart';
import 'package:bloc_example/pages/home/widgets/expanded_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final _isPunchlineShown = ValueNotifier(false);

  bool get isProgressState => context.read<JokeBloc>().state is ProgressState;

  @override
  void initState() {
    super.initState();
    context.read<JokeBloc>().add(GetJokeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JokeBloc, BaseState>(
      listenWhen: (context, state) {
        return state is ErrorState;
      },
      listener: _onAction,
      buildWhen: (previous, current) {
        return current is ProgressState || previous is ProgressState;
      },
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Joke page :)'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ExpandedCardWidget(
                  child: isProgressState
                      ? const CircularProgressIndicator()
                      : Text(
                          state is GotJokeState
                              ? state.joke.setup ?? ''
                              : 'Joke',
                          textAlign: TextAlign.center,
                        ),
                ),
                const SizedBox(height: 12),
                ExpandedCardWidget(
                  onTap: () => _isPunchlineShown.value = true,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _isPunchlineShown,
                    builder: (_, isPunchlineShown, ___) {
                      if (isPunchlineShown) {
                        if (isProgressState) {
                          return const CircularProgressIndicator();
                        } else {
                          return Text(
                            state is GotJokeState
                                ? state.joke.punchline ?? ''
                                : 'Punchline',
                            textAlign: TextAlign.center,
                          );
                        }
                      } else {
                        return const Text(
                          'Show punchline!',
                          textAlign: TextAlign.center,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _generateFact,
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }

  void _generateFact() {
    _isPunchlineShown.value = false;
    context.read<JokeBloc>().add(GetJokeEvent());
  }

  void _onAction(BuildContext context, BaseState state) {
    if (state is ErrorState) {
      showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text(state.msg),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }
}
