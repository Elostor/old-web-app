import 'package:flutter/foundation.dart' show immutable;

@immutable
sealed class ConnectionEvent {}

class ConnectedEvent extends ConnectionEvent {}

class DisconnectedEvent extends ConnectionEvent {}