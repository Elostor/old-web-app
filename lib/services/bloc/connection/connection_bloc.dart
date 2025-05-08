import 'dart:async';
import 'package:MaydaNozzle/services/bloc/connection/connection_event.dart';
import 'package:MaydaNozzle/services/bloc/connection/connection_state.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionBlocState> {
  StreamSubscription? subscription;

  ConnectionBloc()
      : super(const ConnectionStateInitialState(isLoading: true)) {

    on<ConnectedEvent>((event, emit) =>
        emit(const ConnectionStateInitializationSuccessful(isLoading: false)));

    on<DisconnectedEvent>((event, emit) => const ConnectionStateInitializationFailed(isLoading: true));

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          if (result != ConnectivityResult.none) {
            add(ConnectedEvent());
          } else {
            add(DisconnectedEvent());
          }
        });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
