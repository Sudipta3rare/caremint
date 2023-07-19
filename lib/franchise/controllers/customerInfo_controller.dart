import 'package:get/get.dart';

import '../models/customer_info.dart';

class CustomerInfoController extends GetxController{
    List<CustomerInfoModel> listCustomerInfo = <CustomerInfoModel>[
      CustomerInfoModel(
        customerName: 'Jhon Doe',
        customerAddress: '111 XYZ Street',
        customerEmail: "jhon.doe@example.com",
        customerPhone: '1234567890',
        customerServiceRequested: 'Exterior Services',
        date: '17/05/2023',
        paymentMode: 'Card'
      )
    ];
}