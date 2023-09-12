

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
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
    print("here");
    print(imagesList[0].path);
    FormData formData = FormData.fromMap({
      "description" : des.text.toString() ,
      "image":
      await MultipartFile.fromFile( imagesList[0].path, filename: "${order.id}-1" , contentType: MediaType('image','jpg') ),
    });
    ApiRequest(url: Constant.baseUrl+'/api/complete-order/${order.id}', frmData: formData
    ).postTokenFile(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess(data);
        print(data);
      },
      onError: (error) => {
        if (onError != null) onError(error)},
    );
  }

}