import 'dart:ui';

import 'package:caremint/constants/constants.dart';
import 'package:caremint/franchise/controllers/customerInfo_controller.dart';
import 'package:caremint/franchise/models/helper_submitImage/submit_Image_helper.dart';
import 'package:caremint/franchise/models/ongoingOrderModel.dart';
import 'package:caremint/services/api_requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../../constants/app_colors.dart';

class SubmitPictureController extends GetxController{
  static SubmitPictureController to = Get.find();
  RxBool  isLoading = false.obs;
  TextEditingController des = TextEditingController();

  CustomerInfoController ctrl = CustomerInfoController.to;
  final ImagePicker picker = ImagePicker();
   List<XFile> imagePathList = [];
  Future<void> pickMultipleImg () async {
    imagePathList = await picker.pickMultiImage(
      requestFullMetadata: false,
      maxHeight: 200,
      maxWidth: 200
    );
  update();
  }
  Future<void> pickCameraImage () async {
   XFile? image = await picker.pickImage(source: ImageSource.camera);
    imagePathList.add(image!);
  update();
  }
  Future<void> postSubmitPicture(OngoingOrders order) async {
    isLoading.value = true;
    print(imagePathList[0].path);

    SubmitImageProvider().postOrderStatus(
        onSuccess: (onSuccess){

          isLoading.value= false;
          update();
          ctrl.onRefresh();
          Get.offAllNamed('/tabview');


        },
        onError: (onError){
          isLoading.value= false;
          Get.snackbar(
            'Error',
            'Order completion failed. Try again later!',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Color(0xffffffff),
            backgroundColor: AppStyle().gradientColor2,
            duration: Duration(seconds: 2),
          );
          ctrl.onRefresh();
          update();
        },
        order: order,
        des: des,
        imagesList: imagePathList);
    isLoading.value= false;
      update();


  }


}