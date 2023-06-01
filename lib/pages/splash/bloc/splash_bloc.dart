import 'dart:async';

import 'package:bloc_structure_template/common/enums/loading_status.dart';
import 'package:bloc_structure_template/utils/logger_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import '../../../repository/auth_repository.dart';
import '../../../utils/repository_manager.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final _authRepository = getIt.get<AuthRepository>();

  SplashBloc() : super( SplashInitialState()) {
    on<OpenScreenEvent>(_handleSplashInitEvent);
  }

  Future<void> _handleSplashInitEvent(
      OpenScreenEvent event,
    Emitter<SplashState> emit,
  ) async {

    await Future.delayed(const Duration(seconds: 3), () {
      getUsers();
      // emit(state.copyWith(message: "asdasas", status: LoadStatus.success));
    },);
  }

  void getUsers() async {
    EasyLoading.show();
    try {
      var homeModelResponse = await _authRepository.getUsers();

      EasyLoading.dismiss();
      if (homeModelResponse.results!.isNotEmpty) {
        print("ABC ${homeModelResponse}");
      } else {
        logger.e("Error");
      }
    } catch (error) {
      EasyLoading.dismiss();
      logger.e("Controller>>> error $error");
    }
  }

  void doDeleteAccount() async {
    EasyLoading.show();
    try {
      // var commonResponse = await _authRepository.doLogin(
      //     emailId: "",
      //     password: "");

      var commonResponse = await _authRepository.doDeleteAccount();

      EasyLoading.dismiss();
      if (commonResponse.message.isNotEmpty && commonResponse.status) {
        print("ABC ${commonResponse.message}");
      } else {
        logger.e(commonResponse.message);
      }
    } catch (error) {
      EasyLoading.dismiss();
      logger.e("Controller>>>>>> error $error");
    }
  }

  void doSignIn() async {
    EasyLoading.show();
    try {
      // var commonResponse = await _authRepository.doLogin(
      //     emailId: "",
      //     password: "");

      var commonResponse = await _authRepository.doLogin(
          emailId: "1234567897", password: "12345678");

      EasyLoading.dismiss();
      if (commonResponse.message.isNotEmpty && commonResponse.status) {
        print("ABC ${commonResponse.bearerToken}");
        doDeleteAccount();
      } else {
        logger.e(commonResponse.message);
      }
    } catch (error) {
      EasyLoading.dismiss();
      logger.e("Controller>>>>>> error $error");
    }
  }

  void doSignOut() async {
    EasyLoading.show();
    try {
      var commonResponse = await _authRepository.doLogOut();

      EasyLoading.dismiss();
      if (commonResponse.message.isNotEmpty && commonResponse.status) {
        print("ABC ${commonResponse.message}");
      } else {
        logger.e(commonResponse.message);
      }
    } catch (error) {
      EasyLoading.dismiss();
      logger.e("Controller>>>>>> error $error");
    }
  }
}
