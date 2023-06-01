import 'dart:io';

import 'package:bloc_structure_template/api_service/api_constant.dart';
import 'package:bloc_structure_template/api_service/dio_client.dart';
import 'package:bloc_structure_template/model/CommonResponse.dart';
import 'package:bloc_structure_template/model/home_model.dart';
import 'package:bloc_structure_template/utils/repository_manager.dart';

import '../common/enums/method_type.dart';

abstract class AuthRepository {

  Future<CommonResponse> doLogin({String emailId, String password});

  Future<HomeModel> getUsers();

  Future<CommonResponse> doLogOut({String token});

  Future<CommonResponse> doDeleteAccount();
}

class AuthRepositoryImpl extends AuthRepository {
  late DioClient _dioClient;

  AuthRepositoryImpl() {
    _dioClient = getIt.get<DioClient>();
  }

  @override
  Future<CommonResponse> doLogin(
      {String emailId = "", String password = ""}) async {
    try {
      var jsonBody = {
        "phone": emailId,
        "password": password,
      };
      var response = await _dioClient.request(
          ApiConstant.login, MethodType.post, jsonBody);

      return CommonResponse.fromJson(response, (json) => response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HomeModel> getUsers(
      {String emailId = "", String password = ""}) async {
    try {
      var response =
          await _dioClient.request(ApiConstant.getUser, MethodType.get);

      return HomeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> doDeleteAccount({String token = ""}) async {
    try {
      var response =
          await _dioClient.request(ApiConstant.login, MethodType.delete);

      return CommonResponse.fromJson(response, (json) => response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> doLogOut({String token = ""}) async {
    try {
      var response =
          await _dioClient.request(ApiConstant.logout, MethodType.get);

      return CommonResponse.fromJson(response, (json) => response);
    } catch (e) {
      rethrow;
    }
  }
}
