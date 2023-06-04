import 'package:bloc_example/base/bloc/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Extension to emit events in another way.
extension EmitterExtension on Emitter {
  /// Provides an opportunity to emit stream of events.
  void streamAsync(Stream<BaseState> stream) =>
      forEach<BaseState>(stream, onData: (state) => state);
}