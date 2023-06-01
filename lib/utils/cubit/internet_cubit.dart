import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Intial, Lost, Gained }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  final Connectivity? connectivity;

  InternetCubit({required this.connectivity}) : super(InternetState.Lost) {
    checkConnection();
  }

  void checkConnection() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
          if (result == ConnectivityResult.mobile ||
              result == ConnectivityResult.wifi) {
            emit(InternetState.Gained);
          } else {
            emit(InternetState.Lost);
          }
        });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}

