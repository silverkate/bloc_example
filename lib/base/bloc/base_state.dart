abstract class BaseState {}

/// Initial state.
class InitState extends BaseState {}

/// State to handle showing progress.
class ProgressState extends BaseState {}

/// Error state.
class ErrorState extends BaseState {
  ErrorState({
    required this.msg,
  });

  final String msg;
}
