import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionCheckerState {}

class InternetConnectionLoading extends ConnectionCheckerState {}

class InternetConnectionConnected extends ConnectionCheckerState {
  final InternetConnectionStatus? internetConnectionStatus;

  InternetConnectionConnected({required this.internetConnectionStatus});
}

class InternetConnectionDisconnected extends ConnectionCheckerState {}
