import 'package:flutter/foundation.dart' show immutable;

@immutable
sealed class ConnectionBlocState {
  final bool isLoading;

  const ConnectionBlocState({required this.isLoading});
}

class ConnectionStateInitialState extends ConnectionBlocState {
  const ConnectionStateInitialState({required bool isLoading})
      : super(isLoading: isLoading);
}

class ConnectionStateInitializationSuccessful extends ConnectionBlocState {
  const ConnectionStateInitializationSuccessful({required bool isLoading})
      : super(isLoading: isLoading);
}

class ConnectionStateInitializationFailed extends ConnectionBlocState {
  const ConnectionStateInitializationFailed({required bool isLoading})
      : super(isLoading: isLoading);
}