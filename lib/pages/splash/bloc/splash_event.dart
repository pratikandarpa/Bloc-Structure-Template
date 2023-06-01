part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object?> get props => [];
}

class OpenScreenEvent extends SplashEvent {}