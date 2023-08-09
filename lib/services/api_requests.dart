import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  final dynamic frmData;
  final dynamic frmData1;
  final store = GetStorage();

  ApiRequest({
    required this.url,
    this.data,
    this.frmData,
    this.frmData1,
  });

  Dio _dio() {
    // Put your authorization token if required
    return Dio(
      BaseOptions(
        headers: {
          // 'Authorization': 'Bearer ${Constant.adminToken}', //$adminToken',
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        baseUrl: Constant.baseUrl,
      ),
    );
  }

  Future<void> get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    await _dio().get(url, queryParameters: data).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> post({
    required Function() beforeSend,
    required Function(dynamic frmData) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    _dio().post(url, data: frmData).then((res) {
      onSuccess(res);
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> request({
    required Function() beforeSend,
    required Function(dynamic frmData1) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    _dio().request(url, data: frmData1).then((res) {
      onSuccess(res);
    }).catchError((error) {
      onError(error);
    });
  }
}