/*
This is api provider
This page is used to get data from API
 */

import '../../../model/login_model.dart';

import 'package:dio/dio.dart';

import '../apps/constant.dart';

class ApiProvider {
  Dio dio = Dio();
  late Response response;
  String connErr = 'İnternet bağlantınızı kontrol ediniz!!';

  Future<Response> postConnect(
    url,
    data,
  ) async {
    print('url : ' + url.toString());
    print('postData : ' + data.toString());
    try {
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;

      return await dio.post(url, data: data);
    } on DioError catch (e) {
      print(e.toString() + ' | ' + url.toString());
      if (e.type == DioErrorType.response) {
        int? statusCode = e.response!.statusCode;
        if (statusCode == STATUS_NOT_FOUND) {
          throw "Api not found";
        } else if (statusCode == STATUS_INTERNAL_ERROR) {
          throw "Internal Server Error";
        } else {
          throw e.error.message.toString();
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        throw e.message.toString();
      } else if (e.type == DioErrorType.cancel) {
        throw 'cancel';
      }
      throw connErr;
    } finally {
      dio.close();
    }
  }

  Future<List<LoginModel>> login(String email, String password) async {
    var postData = {
      'username': email,
      'password': password,
      'key': "key",
    };
    response = await postConnect(LOGIN_API, postData);
    print(response.data.runtimeType);
    if (response.data['app_status'] == STATUS_OK) {
      final responseList = response.data;
      List<LoginModel> listData = [LoginModel.fromJson(responseList)];
      return listData;
    } else {
      throw response.data['message'];
    }
  }
}
