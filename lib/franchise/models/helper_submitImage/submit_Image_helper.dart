import 'dart:io';

import 'package:dio/dio.dart';

import 'package:caremint/franchise/models/ongoingOrderModel.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/constants.dart';
import '../../../services/api_requests.dart';

class SubmitImageProvider{
  Future<void> postOrderStatus({
    Function()? beforeSend,
    required Function(dynamic success) onSuccess,
    required Function(dynamic error) onError,
    required OngoingOrders order,
    required TextEditingController des,
    required List<dynamic> imagesList,

  }) async {
    String fileName = imagesList[0].path.split('/').last;

    FormData formData = FormData.fromMap({
      "description" : des.text.toString() ,
      // "image":
      // await MultipartFile.fromFile( imagesList[0].path, filename:fileName),
    });
    print(formData.files);
    ApiRequest(url: Constant.baseUrl+'/api/complete-order/${order.id}', frmData: formData
    ).postToken(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess(data);
      },
      onError: (error) => {
        if (onError != null) onError(error)},
    );
  }

}