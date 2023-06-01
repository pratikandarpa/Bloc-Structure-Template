import 'dart:developer';

import 'package:bloc_structure_template/api_service/api_constant.dart';
import 'package:bloc_structure_template/api_service/api_interceptor.dart';
import 'package:bloc_structure_template/common/constants/string_constants.dart';
import 'package:bloc_structure_template/common/enums/method_type.dart';
import 'package:dio/dio.dart';

import '../common/widgets/common_methods.dart';


class DioClient {
  late Dio _dio;

  DioClient init()  {
    _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))
      ..interceptors.add(ApiInterceptors());
    return this;
  }

  Future<Map<String, dynamic>> request(
      String url, MethodType method, [dynamic params]) async {
    try {
      Response response;
      if (await CommonMethods.checkConnectivity()) {
        if (method == MethodType.post) {
          response = await _dio.post(url, data: params);
        } else if (method == MethodType.delete) {
          response = await _dio.delete(url);
        } else if (method == MethodType.patch) {
          response = await _dio.patch(url);
        } else {
          response = await _dio.get(
            url,
          );
        }

        return response.data;
      } else {
        return {"message": noInternetConnection, "status": false};
      }
    } on DioError catch (dioError) {
      if (dioError.response?.statusCode == 401) {

      }
      return {"message": dioError.response?.data["message"], "status": false};
    } catch (error) {
      return {"message": error.toString(), "status": false};
    }
  }

  Future<Map<String, dynamic>> multipartRequest(
      String url, MethodType method, dynamic params) async {
    try {
      Response response;
      if (await CommonMethods.checkConnectivity()) {
        response = await _dio.post(url, data: params,options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
        return response.data;
      } else {
        return {"message": noInternetConnection, "status": false};
      }
    } on DioError catch (dioError) {
      if (dioError.response?.statusCode == 401) {

      }
      return {"message": dioError.response?.data["message"], "status": false};
    } catch (error) {
      return {"message": error.toString(), "status": false};
    }
  }
}



