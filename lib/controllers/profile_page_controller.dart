
import 'package:caremint/constants/constants.dart';
import 'package:caremint/models/timeslots_model.dart';
import 'package:caremint/services/api_requests.dart';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../constants/app_colors.dart';
import '../models/user_model.dart';

class ProfilePageController extends GetxController {
  static ProfilePageController to = Get.find();

  var store = GetStorage();
  late  String token ;
  /*@override
  void onInit() {
    super.onInit();
  }*/

}